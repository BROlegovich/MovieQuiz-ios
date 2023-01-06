//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Роман on 02.01.2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
