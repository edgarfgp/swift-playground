//
//  SettingsViewController.swift
//  PlayGround
//
//  Created by Edgar Gonzalez Pena on 23/10/2019.
//  Copyright © 2019 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit

class TodoViewController: UIViewController {
        
    @IBOutlet var todotableView: UITableView!
    
    var todoList: TodoList
     
    required init?(coder aDecoder: NSCoder) {
        todoList = TodoList()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    @IBAction func addTodoButton(_ sender: Any) {
        let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: AddTodoItemViewController.self)) as! AddTodoItemViewController
        newViewController.addItemDelegate = self
        navigationController?.pushViewController(newViewController, animated: true)
    }
}

extension TodoViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoList.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        let item = todoList.todos[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckMark(for: cell, with: item)
        return cell
    }
    }

extension TodoViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = todoList.todos[indexPath.row]
            configureCheckMark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todoList.todos.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        // we can also use tableView.reloadData() without animations
    }
}

extension TodoViewController : AddItemDelegate {
    func didUserAddTodoItem(_ vc: AddTodoItemViewController, newItem: CheckListItem) {
        _ = todoList.todos.append(newItem)
        todotableView.reloadData()
    }
    
    func didUserCancelAddingNewItem(_ vc: AddTodoItemViewController) {
    }
    
    func configureCheckMark(for cell: UITableViewCell, with item: CheckListItem) {
        if item.isCHecked {
          cell.accessoryType = .checkmark
        } else {
          cell.accessoryType = .none
        }
        item.toogleCheck()
      }
    
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.text
        }
    }
}
