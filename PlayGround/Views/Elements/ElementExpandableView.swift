//
//  ElementExpandableView.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 21/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit

class ElementExpandableView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ValueLabel: UILabel!

    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        let attributes = [NSAttributedString.Key.font:self,]
        let attString = NSAttributedString(string: string,attributes: attributes)
        let framesetter = CTFramesetterCreateWithAttributedString(attString)
        return CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(location: 0,length: 0), nil, CGSize(width: width, height: .greatestFiniteMagnitude), nil)
        }
    
    public static func getHeight(viewModel : ElementExpandableViewModel, availableWidht: CGFloat) -> CGFloat {
        return 40
    }
    
    func getCalculatedSizeOfString(text: NSString , font: UIFont, availableWidth: CGFloat) -> CGFloat {
        
        let size = CGSize(width: availableWidth, height: CGFloat.greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        let attributes = [NSAttributedString.Key.font: font]

        let rectangleHeight = String(text).boundingRect(with: size, options: options, attributes: attributes, context: nil).height

            return rectangleHeight
    }
    
    public func setUp(viewModel : ElementExpandableViewModel){
        titleLabel.text = viewModel.title
        ValueLabel.text = viewModel.value
    }
}


