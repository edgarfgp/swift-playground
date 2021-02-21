//
//  ElementBasedCell.swift
//  PlayGround
//
//  Created by Edgar Gonzalez on 20/2/21.
//  Copyright © 2021 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {
    
    static let cellId = "ElementBasedTableViewCell"
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        contentView.backgroundColor = UIColor(hex: "F9F9F9")
    }
    
    override func prepareForReuse() {
        contentView.subviews[0].removeFromSuperview()
    }
    
    public func setUp(elementView: UIView){
        elementView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(elementView)
        
        elementView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        let trailingAnchor = elementView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        trailingAnchor.priority = UILayoutPriority.init(rawValue: 999.0)
        trailingAnchor.isActive = true
        
        elementView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        
        elementView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        let bottomAnchor = elementView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomAnchor.priority = UILayoutPriority.init(rawValue: 999.0)
        bottomAnchor.isActive = true
    }
    
}
