//
//  Alert.swift
//  HW_4.1
//
//  Created by Konstantin Losev on 13.09.2021.
//

import UIKit

extension LoginViewController {
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            _ in self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
