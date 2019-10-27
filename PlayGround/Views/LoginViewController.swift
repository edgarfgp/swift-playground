//
//  LoginViewController.swift
//  PlayGround
//
//  Created by Edgar Gonzalez Pena on 20/10/2019.
//  Copyright © 2019 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var welconeDelegate: WelcomeDelegate!
    
    override func viewDidLoad() {
        navigationItem.title = "Login"
        
       loginButton.applyCustomStyle()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        welconeDelegate?.didUserLogin(name: nameTextField.text ?? "", email: emailTextField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
}

protocol WelcomeDelegate {
    func didUserLogin(name: String, email: String)
}
