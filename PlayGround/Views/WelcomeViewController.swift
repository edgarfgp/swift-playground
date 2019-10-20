//
//  LoginViewController.swift
//  PlayGround
//
//  Created by Edgar Gonzalez Pena on 20/10/2019.
//  Copyright © 2019 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeMessage: UILabel!
    
    @IBOutlet weak var emailMessage: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        navigationItem.title = "Welcome"
        loginButton.applyCustomStyle()
        
        loginButton.addTarget(self, action: #selector(self.navigateToLogin), for: .touchUpInside)
    }
    
    @objc func navigateToLogin(sender: UIButton){
        let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
        newViewController.welconeDelegate = self
        present(newViewController, animated: true, completion: nil)
    }
}

extension WelcomeViewController : WelcomeDelegate {
    func didUserLogin(name: String, email: String) {
        welcomeMessage.text = name
        emailMessage.text = email
    }
}
