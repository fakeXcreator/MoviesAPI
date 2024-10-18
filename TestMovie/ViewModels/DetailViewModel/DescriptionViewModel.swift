//
//  DescriptionViewModel.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import Foundation

final class DescriptionViewModel {
    let tagline: String
    let description: String
    
    init(tagline: String, description: String) {
        self.tagline = tagline
        self.description = description
    }
    
    public func getTagline() -> String {
        return tagline
    }
    
    public func getDescription() -> String {
        return description
    }
}

extension DescriptionViewModel {
    convenience init(movie: MovieDetailsModel) {
        self.init(tagline: movie.tagline ?? "--", description: movie.description)
    }
}
