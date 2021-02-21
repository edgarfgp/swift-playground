//
//  ElementFactory.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 21/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit

protocol IElementViewFactory {
    func createView(vmContext: ElementViewModelContext) -> UIView
}

class ElementViewFactory: IElementViewFactory {
        
    func createExpandableView (vmContext: ElementViewModelContext) -> UIView {
        let view = ElementExpandableView.instantiateFromNib()
        let viewModel = vmContext.currentViewModel as? ElementExpandableViewModel
        guard let elementView = view else { return UIView.init() }
        
        if let vm = viewModel {
            elementView.setUp(viewModel: vm)
        }
        return elementView
    }
    
    func createView(vmContext: ElementViewModelContext) -> UIView {
        switch vmContext.currentViewModel {
            case is ElementExpandableViewModel :
                let view = createExpandableView(vmContext: vmContext)
                return view
            default:
                return UIView.init()
        }
    }
}


extension UIView {
    
    static func instantiateFromNib() -> Self? {
        func instanceFromNib<T: UIView>() -> T? {
            return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
        }
        
        return instanceFromNib()
    }
}
