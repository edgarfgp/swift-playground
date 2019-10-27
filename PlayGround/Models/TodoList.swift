//
//  TodoList.swift
//  PlayGround
//
//  Created by Edgar Gonzalez Pena on 03/11/2019.
//  Copyright © 2019 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation

class TodoList {

    var todos: [CheckListItem] = []

    init() {
      
      let row0Item = CheckListItem()
      let row1Item = CheckListItem()
      let row2Item = CheckListItem()
      let row3Item = CheckListItem()
      let row4Item = CheckListItem()
      
      row0Item.text = "Take a jog"
      row1Item.text = "Watch a movie"
      row2Item.text = "Code an app"
      row3Item.text = "Walk the dog"
      row4Item.text = "Study design patterns"
      
      todos.append(row0Item)
      todos.append(row1Item)
      todos.append(row2Item)
      todos.append(row3Item)
      todos.append(row4Item)
      
    }
    
    func newTodo() -> CheckListItem {
        let item = CheckListItem()
        item.text = ramdomTitle()
        item.isCHecked = true
        todos.append(item)
        return item
    }
    
    private func ramdomTitle() -> String {
        let titles = ["new Todo Item", "I need someting todo", "Generic todo", "Fill me out", "Much todo about nothing"]
        let randomNumber = Int.random(in: 0 ... titles.count - 1)
        return titles[randomNumber]
    }

}
