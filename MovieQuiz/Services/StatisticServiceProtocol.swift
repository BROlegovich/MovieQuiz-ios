//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Роман on 06.01.2023.
//

import Foundation

protocol StatisticService {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
    
    func store(correct count: Int, total amount: Int)
}
