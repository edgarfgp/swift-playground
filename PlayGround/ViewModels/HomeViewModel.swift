//
//  HomeViewModel.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 21/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    public func createElement() -> [ElementViewModel] {
        [
            ElementExpandableViewModel(title: "Edgar", value: "Gonzalez"),
            ElementExpandableViewModel(title: "Edgar", value: "Gonzalez"),
            ElementExpandableViewModel(title: "Edgar", value: "Gonzalez"),
            ElementExpandableViewModel(title: "Edgar", value: "Gonzalez"),
            ElementExpandableViewModel(title: "Edgar", value: "Gonzalez"),
            ElementExpandableViewModel(title: "Edgar", value: "Gonzalez")
            
        ]
    }
}
