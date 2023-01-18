//
//  MoviesLoader.swift
//  MovieQuiz
//
//  Created by Роман on 13.01.2023.
//

import Foundation

protocol MoviesLoading {
    func loadMovies (handler: @escaping (Result<MostPopularMovies, Error>) -> Void)
}

struct MoviesLoader: MoviesLoading  {
    private let networkCLient: NetworkRouting
    
    init(networkCLient: NetworkRouting = NetworkClient()) {
        self.networkCLient = networkCLient
    }
    private var mostPopularMoviesUrl: URL {
        guard let url = URL(string: "https://imdb-api.com/en/API/Top250Movies/k_wx7m8y5a") else {
            preconditionFailure("Unable to construct mostPopularMoviesUrl")
        }
        return url
    }
    
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void) {
        networkCLient.fetch(url: mostPopularMoviesUrl) {result in
            switch result {
            case .success(let data):
                do {
                    let mostPopularMovies = try JSONDecoder().decode(MostPopularMovies.self, from: data)
                    handler(.success(mostPopularMovies))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
