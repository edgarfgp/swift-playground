//
//  LogOutViewController.swift
//  PlayGround
//
//  Created by Edgar Gonzalez Pena on 19/10/2019.
//  Copyright © 2019 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit
import LBTATools

class AddTodoItemViewController: UIViewController {
    
    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
    }
    
    @IBAction func cancellTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
}
