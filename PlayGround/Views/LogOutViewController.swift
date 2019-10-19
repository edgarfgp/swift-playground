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
    
    fileprivate lazy var header: UIView = {
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .red
        return header
    }()
    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        
        contentView.addSubview(header)
        header.fillSuperviewSafeAreaLayoutGuide()
    }
}
