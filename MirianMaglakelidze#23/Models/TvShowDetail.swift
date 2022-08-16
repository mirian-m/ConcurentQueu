//
//  TvShowDetail.swift
//  MirianMaglakelidze#23
//
//  Created by Admin on 8/16/22.
//

import Foundation
import UIKit

struct TvShowDetail: Codable {
    enum CodingKeys: String, CodingKey {
        case id, name, original_name
        case episodeDetail = "last_episode_to_air"
        
    }
    struct EpisodeDetail: Codable {
        let episode_number: Int
        let id: Int
    }
    let id: Int
    let episodeDetail: EpisodeDetail?
    let name: String?
    let original_name: String?
}
