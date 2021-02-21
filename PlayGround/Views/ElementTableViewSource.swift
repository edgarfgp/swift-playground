//
//  ElementBasedTableViewSource.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 21/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit

class ElementTableViewSource: NSObject {
    
    private lazy var elements: [ElementViewModelContext] = []
    
    private var elementFactory: IElementViewFactory
    private var elementHeightCalculator: IElementHeightCalculator
    
    init(elementFactory : IElementViewFactory, elementHeightCalculator : IElementHeightCalculator) {
        self.elementFactory = elementFactory
        self.elementHeightCalculator = elementHeightCalculator
    }
    
    public func updateData(elements: [ElementViewModel]){
        self.elements = elements.map({ viewModel  in
            ElementViewModelContext(currentViewModel: viewModel, previousViewModel: nil, nextViewModel: nil)
        })
    }

    public func getIndex(viewModel: ElementViewModel) -> Int? {
        return elements.firstIndex { $0.currentViewModel == viewModel }
    }
    
    public func insertData(viewModel: ElementViewModel, index: Int) {
        let vmContext = ElementViewModelContext(currentViewModel: viewModel, previousViewModel: nil, nextViewModel: nil)
        
        elements.insert(vmContext, at: index)
    }
    
    public func removeData(index: Int) {
        elements.remove(at: index)
    }
}

extension ElementTableViewSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = elements[indexPath.row]
        let elemenetView = elementFactory.createView(vmContext: element)
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ElementTableViewCell.cellId) as! ElementTableViewCell
        cell.setUp(elementView: elemenetView)
        return cell
    }
}

extension ElementTableViewSource : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let element = elements[indexPath.row]
        guard let currentViewModel = element.currentViewModel else { return  0}
        let heightForRow = elementHeightCalculator.getHeight(vieModel: currentViewModel, availableWidht: tableView.frame.width)
        return heightForRow
    }
}
