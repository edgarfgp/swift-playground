//
//  TableViewHeightEvaluator.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 21/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit

protocol ITableViewHeightEvaluator {
    func requestHeightEvaludation()
}

class TableViewHeightEvaluator: ITableViewHeightEvaluator {
    
    private var tableView : UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func requestHeightEvaludation() {
        UIView.performWithoutAnimation {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
}


