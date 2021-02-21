//
//  ElementHeightCalculator.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 21/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit

protocol IElementHeightCalculator {
    func getHeight(vieModel: ElementViewModel, availableWidht: CGFloat) -> CGFloat
}

class ElementHeightCalculator: IElementHeightCalculator {
    
    func getHeight(vieModel: ElementViewModel, availableWidht: CGFloat) -> CGFloat {
        let elementHeight : CGFloat
        
        switch vieModel {
        case is ElementExpandableViewModel :
            guard let vm = vieModel as? ElementExpandableViewModel else { return 0 }
            elementHeight =
                ElementExpandableView.getHeight(viewModel: vm, availableWidht: availableWidht)
        default:
            elementHeight = 0
        }
        
        return elementHeight
    }
}
