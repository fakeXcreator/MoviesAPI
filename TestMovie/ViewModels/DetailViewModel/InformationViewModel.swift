//
//  InformationViewModel.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import Foundation

final class InformationViewModel {
    let imdbRating: String
    let rated: String
    let genres: String
    let countries: String
    let languages: String
    let stars: String
    
    init(imdbRating: String, rated: String, genres: String, countries: String, languages: String, stars: String) {
        self.imdbRating = imdbRating
        self.rated = rated
        self.genres = genres
        self.countries = countries
        self.languages = languages
        self.stars = stars
    }
    
    public func getImdbRating() -> String {
        return imdbRating
    }
    
    public func getRated() -> String {
        return rated
    }
    
    public func getGenres() -> String {
        return genres
    }
    
    public func getCountries() -> String {
        return countries
    }
    
    public func getLanguages() -> String {
        return languages
    }
    
    public func getStars() -> String {
        return stars
    }
}

extension InformationViewModel {
    convenience init(movie: MovieDetailsModel) {
        self.init(
            imdbRating: movie.imdbRating,
            rated: movie.rated ?? "--",
            genres: movie.genres.joined(separator: ", "),
            countries: movie.countries.joined(separator: ", "),
            languages: movie.language.joined(separator: ", "),
            stars: movie.stars?.joined(separator: ", ") ?? "--"
        )
    }
}
