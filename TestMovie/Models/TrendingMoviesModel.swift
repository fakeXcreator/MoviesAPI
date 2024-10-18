//
//  TrendingMoviesModel.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import Foundation

struct MovieResult: Codable {
    let movie_results: [TrendingMoviesModel]
}

struct TrendingMoviesModel: Codable {
    let title: String
    let year: String
    let imdbID: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case year = "year"
        case imdbID = "imdb_id"
    }
}


