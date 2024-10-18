//
//  MoviesViewModel.swift
//  TestMovie
//
//  Created by Daniil Kim on 18.10.2024.
//

import Foundation

class MoviesViewModel {
    
    private var movies: [TrendingMoviesModel] = []
    private let service: Service
    
    var didUpdateMovies: (() -> Void)?
    
    init(service: Service) {
        self.service = service
    }
    
    func fetchTrendingMovies() {
        service.fetchTrendingMovies { [weak self] result in
            switch result {
            case .success(let data):
                self?.parseMovies(data: data)
            case .failure(let error):
                print("Error fetching movies: \(error)")
            }
        }
    }
    
    private func parseMovies(data: Data) {
        let decoder = JSONDecoder()
        do {
            let movieResult = try decoder.decode(MovieResult.self, from: data)
            self.movies = movieResult.movie_results
            DispatchQueue.main.async { [weak self] in
                self?.didUpdateMovies?()
            }
        } catch {
            print("Error decoding data: \(error)")
        }
    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func movie(at index: Int) -> TrendingMoviesModel {
        return movies[index]
    }
}

