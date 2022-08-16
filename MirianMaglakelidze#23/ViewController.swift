
import UIKit

class ViewController: UIViewController {
    let semaphore = DispatchSemaphore(value: 1)
    var tvShow = TvShow(details: [])
    override func viewDidLoad() {
        super.viewDidLoad()
        getTvShowData()
    }
    
    func getTvShowData() {
        DispatchQueue.global().async {
            self.semaphore.wait()
            let url = "\(Constatn.baseUrl)top_rated?api_key=\(Constatn.apiKey)&language=en-US&page=1"
            ApiColler.shared.getDataBy(urlStr: url) { (result: Result<TvShow, Error>) in
                switch result {
                case .success(let data):
                    self.tvShow = data
                case .failure(let error):
                    print(error)
                }
                self.semaphore.signal()
            }
        }
        
        DispatchQueue.global().async {
            self.semaphore.wait()
            guard let randomTvShow = self.tvShow.details.randomElement() else { return }
            let tvShowUrl = "\(Constatn.baseUrl)\(randomTvShow.id)/similar?api_key=\(Constatn.apiKey)&language=en-US&page=1"
            ApiColler.shared.getDataBy(urlStr: tvShowUrl) { (result: Result<TvShow, Error>) in
                switch result {
                case .success(let data):
                    self.tvShow = data
                case .failure(let error):
                    print(error)
                }
                self.semaphore.signal()
            }
        }
        
        DispatchQueue.global().async {
            self.semaphore.wait()
            guard let randomElement = self.tvShow.details.randomElement() else { return }
            let someUrl = "\(Constatn.baseUrl)\(randomElement.id)?api_key=\(Constatn.apiKey)&language=en-US"
            ApiColler.shared.getDataBy(urlStr: someUrl) { (result: Result<TvShowDetail, Error>) in
                switch result {
                case .success(let data):
                    print("Name is: \(data.name ?? data.original_name ?? "")\nEpisode Number: \(data.episodeDetail?.episode_number ?? 0)")
                case .failure(let error):
                    print(error)
                }
                self.semaphore.signal()
            }
        }
    }
}

