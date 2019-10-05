//
//  CustomViewController.swift
//  PlayGround
//
//  Created by Edgar Gonzalez Pena on 05/10/2019.
//  Copyright © 2019 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit


class CustomViewController: UIViewController {
    
    fileprivate lazy var elementAction: UIView = {
        let elementAction = ElementAction.instantiateFromNib();
        elementAction?.translatesAutoresizingMaskIntoConstraints = false
        return elementAction!
    }()

    override func viewDidLoad() {
        
        view.addSubview(elementAction)
        
        NSLayoutConstraint.activate([
            elementAction.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            elementAction.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            elementAction.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            elementAction.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
