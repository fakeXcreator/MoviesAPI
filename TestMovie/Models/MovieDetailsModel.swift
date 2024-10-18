//
//  MovieDetailsModel.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import Foundation

// MARK: - Welcome
struct MovieDetailsModel: Codable {
    let title, description, year: String
    let tagline: String?
    let releaseDate, imdbID, imdbRating, voteCount: String
    let popularity, youtubeTrailerKey: String
    let rated: String?
    let runtime: Int
    let genres, directors, countries: [String]
    let stars: [String]?
    let language: [String]
    let status, statusMessage: String

    enum CodingKeys: String, CodingKey {
        case title, description, tagline, year
        case releaseDate = "release_date"
        case imdbID = "imdb_id"
        case imdbRating = "imdb_rating"
        case voteCount = "vote_count"
        case popularity
        case youtubeTrailerKey = "youtube_trailer_key"
        case rated, runtime, genres, stars, directors, countries, language, status
        case statusMessage = "status_message"
    }
}



