//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Роман on 03.01.2023.
//

import UIKit

class AlertPresenter: AlertPresenterProtocol {
    var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    func showAlert(quiz result: AlertModel) {
        let alert = UIAlertController(title: result.title, message: result.message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default, handler: result.completion)
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
