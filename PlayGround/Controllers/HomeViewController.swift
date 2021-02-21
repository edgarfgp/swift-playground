//
//  HomeView.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 20/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let dataSource = ElementTableViewSource(
        elementFactory: ElementViewFactory(), elementHeightCalculator: ElementHeightCalculator())
    
    private lazy var viewModel = HomeViewModel()

    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.bounds
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        tableView.register(ElementTableViewCell.self, forCellReuseIdentifier: ElementTableViewCell.cellId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        dataSource.updateData(elements: viewModel.createElement())
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
    }

}
