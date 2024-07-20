//
//  WelcomeViewController.swift
//  HW_4.1
//
//  Created by Konstantin Losev on 13.09.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var nameUser: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome \(nameUser ?? "User")!"
    }
}
