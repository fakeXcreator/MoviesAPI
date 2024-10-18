//
//  HeaderViewModel.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import Foundation

final class HeaderViewModel {
    let title: String
    let releaseDate: String
    
    init(title: String, releaseDate: String) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    public func getTitle() -> String {
        return title
    }
    
    public func getReleaseDate() -> String {
        return releaseDate
    }
}

extension HeaderViewModel {
    convenience init(movie: MovieDetailsModel) {
        self.init(title: movie.title, releaseDate: movie.releaseDate)
    }
}
