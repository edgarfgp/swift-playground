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

class LogOutViewController: UIViewController {
    
    @IBOutlet var contentView: UIView!
    
    @IBAction func dashboardTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
    }
}
