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
        elementAction?.backgroundColor = .orange
        return elementAction!
    }()
    
    fileprivate lazy var headerVC : HeaderViewController = {
        let header = HeaderViewController()
        header.view.backgroundColor = .green
        header.didMove(toParent: self)
        header.view.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    fileprivate func setUpConstraintsForElementAction() {
        NSLayoutConstraint.activate([
            elementAction.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            elementAction.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            elementAction.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            elementAction.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    fileprivate func setUpConstraintsForHeaderVC() {
        NSLayoutConstraint.activate([
            headerVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerVC.view.topAnchor.constraint(equalTo: elementAction.bottomAnchor, constant: 20),
            headerVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerVC.view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func viewDidLoad() {
        
        view.addSubview(elementAction)
        addChild(headerVC)
        view.addSubview(headerVC.view)
        
        setUpConstraintsForElementAction()
        setUpConstraintsForHeaderVC()
    }
}
