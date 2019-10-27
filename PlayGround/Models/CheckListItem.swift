//
//  CheckListItem.swift
//  PlayGround
//
//  Created by Edgar Gonzalez Pena on 03/11/2019.
//  Copyright © 2019 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation

class CheckListItem {
    var text = ""
    var isCHecked = false
    
    func toogleCheck() {
        isCHecked = !isCHecked
    }
}
