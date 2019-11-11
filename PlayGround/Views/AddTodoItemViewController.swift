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

protocol AddItemDelegate : class {
    func didUserAddTodoItem(_ vc : AddTodoItemViewController, newItem: CheckListItem)
    func didUserCancelAddingNewItem(_ vc: AddTodoItemViewController)
}

class AddTodoItemViewController: UIViewController {
    
    @IBOutlet var contentView: UIView!
        
    @IBOutlet weak var newTodoTextField: UITextField!
    
    weak var addItemDelegate: AddItemDelegate?
    
    override func viewDidLoad() {
        newTodoTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        newTodoTextField.becomeFirstResponder()
    }
    
    @IBAction func cancellTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        addItemDelegate?.didUserCancelAddingNewItem(self)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        let newItem = CheckListItem()
        
        if let textFieldText = newTodoTextField.text {
            newItem.text = textFieldText
        }
        newItem.isCHecked = false
        addItemDelegate?.didUserAddTodoItem(self, newItem: newItem)
    }
}

extension AddTodoItemViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        newTodoTextField.resignFirstResponder()
        return false
    }
}
