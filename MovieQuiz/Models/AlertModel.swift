//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Роман on 03.01.2023.
//

import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: (UIAlertAction)->Void
}
