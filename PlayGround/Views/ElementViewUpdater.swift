//
//  File.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 21/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit

protocol IElementViewUpdater {
    func update(viewModel: ElementViewModel)
    func insert(viewModel: ElementViewModel, index: Int)
    func remove(viewModel: ElementViewModel)
}

class ElementViewUpdater: IElementViewUpdater {
    
    private var tableView : UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func update(viewModel: ElementViewModel) {
        
        guard let source = tableView.dataSource as? ElementTableViewSource else { return }
        
        let sourceIndex = source.getIndex(viewModel: viewModel)
        
        guard let index = sourceIndex else { return }
        
        if index != -1 {
            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
        }
    }
    
    func insert(viewModel: ElementViewModel, index: Int) {
        guard let source = tableView.dataSource as? ElementTableViewSource else { return }
        
        source.insertData(viewModel: viewModel, index: index)
    }
    
    func remove(viewModel: ElementViewModel) {
        guard let source = tableView.dataSource as? ElementTableViewSource else { return }
        
        let sourceIndex = source.getIndex(viewModel: viewModel)
        
        guard let index = sourceIndex else { return }
        
        if index != -1 {
            source.removeData(index: index)
            tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        }
        
    }
    
    
}
