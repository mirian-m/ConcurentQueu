//
//  TvShow.swift
//  MirianMaglakelidze#23
//
//  Created by Admin on 8/16/22.
//
import Foundation
import UIKit

struct TvShow: Codable {
    enum CodingKeys: String, CodingKey {
        case details = "results"
    }
    
    struct TvDetails: Codable {
        var first_air_date: String?
        var id: Int
        var name: String?
        var original_language: String?
        var original_name: String?
        var overview: String?
        var popularity: Double?
        var poster_path: String?
        var vote_average: Double?
        var vote_count: Int?
    }
    var details: [TvDetails]
}

