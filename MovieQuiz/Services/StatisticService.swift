//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Роман on 06.01.2023.
//

import Foundation

final class StatisticServiceImplementation: StatisticService {
    // Properties
    
    private let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case correct, total, bestGame, gamesCount
    }
    
    var correct: Int {
            userDefaults.integer(forKey: Keys.correct.rawValue)
        }
    
    var total: Int {
        userDefaults.integer(forKey: Keys.correct.rawValue)
    }
    
    var bestGame: GameRecord {
        get {
            guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                    let record = try? JSONDecoder().decode(GameRecord.self, from: data) else {
            return .init(correct: 0, total: 0, date: Date())
        }
            return record
        }
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    
    var gamesCount: Int {
        get {
            userDefaults.integer(forKey: Keys.gamesCount.rawValue)
            }
        set {
            userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var totalAccuracy: Double {
        get {
            let total = Double(userDefaults.integer(forKey: Keys.total.rawValue))
            let correct = Double(userDefaults.integer(forKey: Keys.correct.rawValue))
            return 100 * (correct / total)
        }
    }
    
    // Methods
    func store(correct count: Int, total amount: Int) {
             gamesCount += 1
             userDefaults.set(self.total + amount, forKey: Keys.total.rawValue)
             userDefaults.set(self.correct + count, forKey: Keys.correct.rawValue)

             if bestGame < GameRecord(correct: count, total: amount, date: Date()) {
                 self.bestGame = GameRecord(correct: count, total: amount, date: Date())
             } else {
                 self.bestGame = bestGame
             }
         }
    
}

