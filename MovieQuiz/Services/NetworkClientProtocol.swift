//
//  NetworkClientProtocol.swift
//  MovieQuiz
//
//  Created by Роман on 18.01.2023.
//

import Foundation

protocol NetworkClientProtocol {
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void)
}
