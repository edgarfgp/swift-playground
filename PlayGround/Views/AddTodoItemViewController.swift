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

protocol AddItemDelegate {
    func didUserAddTodoItem(textTodo: String)
}

class AddTodoItemViewController: UIViewController {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var newTodoTextField: UITextField!
    
    var addItemDelegate: AddItemDelegate!
    
    override func viewDidLoad() {
    }
    
    @IBAction func cancellTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        addItemDelegate?.didUserAddTodoItem(textTodo: newTodoTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}
