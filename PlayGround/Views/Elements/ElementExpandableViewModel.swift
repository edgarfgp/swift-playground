//
//  ElementExpandableView.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 21/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation

class ElementViewModel : Equatable {
    var elementType = "\(ElementViewModel.self)"
    var dataContext: String = ""

    static func == (lhs: ElementViewModel, rhs: ElementViewModel) -> Bool {
        return lhs.dataContext == rhs.dataContext && lhs.elementType == rhs.elementType
    }
}

class ElementViewModelContext {
    var currentViewModel : ElementViewModel?
    var previousViewModel : ElementViewModel?
    var nextViewModel : ElementViewModel?
    
    init(currentViewModel : ElementViewModel?, previousViewModel : ElementViewModel?,
         nextViewModel : ElementViewModel?) {
        self.currentViewModel = currentViewModel
        self.previousViewModel = previousViewModel
        self.nextViewModel = nextViewModel
    }
}

class ElementExpandableViewModel : ElementViewModel {

    var title : String
    var value : String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
}
