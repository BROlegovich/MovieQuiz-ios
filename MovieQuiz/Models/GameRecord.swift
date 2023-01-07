//
//  GameRecord.swift
//  MovieQuiz
//
//  Created by Роман on 06.01.2023.
//

import Foundation

struct GameRecord: Codable, Comparable {
    let correct: Int
    let total: Int
    let date: Date
    
    static func < (currentResult: GameRecord, bestResult: GameRecord) -> Bool {
        return currentResult.correct < bestResult.correct
    }
}
