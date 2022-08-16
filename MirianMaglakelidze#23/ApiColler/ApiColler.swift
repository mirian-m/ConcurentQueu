//
//  ApiColler.swift
//  MirianMaglakelidze#23
//
//  Created by Admin on 8/16/22.
//

import Foundation
import UIKit

class ApiColler {
    static var shared = ApiColler()
    
    func getDataBy<T: Codable>(urlStr: String, comlition: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            guard let data = data, error == nil else { return }
            do {
                let tvShow = try JSONDecoder().decode(T.self, from: data)
                comlition(.success(tvShow))
            } catch {
                comlition(.failure(error))
            }
        }.resume()
    }
    
}
