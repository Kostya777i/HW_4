//
//  LoginViewController.swift
//  HW_4.1
//
//  Created by Konstantin Losev on 23.08.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //    MARK: - IBOutlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userTextConst: NSLayoutConstraint!
    @IBOutlet weak var passwordTextConst: NSLayoutConstraint!
    @IBOutlet weak var logInConst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
        
        // сокрытие клавиатуры тапом поэкрану
        view.makeDissmissKeyboardTap()
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userTextConst.constant -= view.bounds.width
        passwordTextConst.constant -= view.bounds.width
        logInConst.constant += view.bounds.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateLayouts()
    }
    
    //    передача имени пользователя в приветствие следующего экрана
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        welcomeVC.nameUser = kostya.userName
    }
    
    //    Кнопка логина
    @IBAction func logInButton() {
        
        //    Проверка на nil если строки пустые вызов алерта
        guard let inputText = userNameTextField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please enter User name")
            return
        }
        
        //    Функция логина
        if userNameTextField.text == kostya.userName && passwordTextField.text == kostya.password {
            performSegue(withIdentifier: "Login", sender: nil)
        } else {
            showAlert(with: "Login or password incorrect", and: "Try again")
            return
        }
    }
    
    @IBAction func forgotUserName() {
        showAlert(with: "User name is ", and: "\(kostya.userName)")
    }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Password ", and: "\(kostya.password)")
    }
    
    // MARK: - Удаление User namу и password при логауте
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    //    переход с поля логина на поле пароля по нажатию next и дублирование кнопки Login кнопкой done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.resignFirstResponder()
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            logInButton()
        }
        return true
    }
    
    // MARK: - Анимация
    
    private func animateLayouts() {
        
        userTextConst.constant = 0
        animateLayout(duration: 0.4, delay: 1.4)
        
        passwordTextConst.constant = 0
        animateLayout(duration: 0.4, delay: 1.8)
        
        logInConst.constant = 25
        animateLayout(duration: 0.8, delay: 2.0)
    }
    
}

private extension LoginViewController {
    
    func animateLayout(duration: Double, delay: Double) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut], animations: { [weak self] in
            self?.view.layoutIfNeeded()
        })
    }
}
