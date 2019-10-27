//
//  CustomViewController.swift
//  PlayGround
//
//  Created by Edgar Gonzalez Pena on 05/10/2019.
//  Copyright © 2019 Edgar Gonzalez Pena. All rights reserved.
//

import Foundation
import UIKit


class CustomViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var isExpanded : Bool = false
    
    fileprivate lazy var expandedView : ExpandableView = {
        let expandableView = ExpandableView.instantiateFromNib();
        expandableView?.translatesAutoresizingMaskIntoConstraints = false
        return expandableView!
    }()
    
    override func viewDidLoad() {
        
        let basicGesture = UITapGestureRecognizer(target: self, action: #selector(self.didCustomViewEAxpand))
        expandedView.addGestureRecognizer(basicGesture)
        
        containerView.addSubview(expandedView)
        expandedView.applyCustomStyle()
        setUpConstraintsForExpandableView()
        expandedView.applyCustomStyle()
    }
    
    @objc func didCustomViewEAxpand(sender : UITapGestureRecognizer) {
        
        if !isExpanded {
            isExpanded = true
            UIView.animate(withDuration: 0.8, animations: {
                self.expandedView.heightAnchor.constraint(equalToConstant: 300).isActive = true
                self.expandedView.arrowImage.transform = CGAffineTransform(rotationAngle: .pi)
                self.containerView.layoutIfNeeded()
            })
        } else {
            isExpanded  = false
            UIView.animate(withDuration: 0.8, animations: {
                self.expandedView.heightAnchor.constraint(equalToConstant: 50).isActive = true
                self.expandedView.arrowImage.transform = CGAffineTransform(rotationAngle: 0)
                self.containerView.layoutIfNeeded()
            })
        }
        
        containerView.layoutIfNeeded()
    }
    
   fileprivate func setUpConstraintsForExpandableView() {
       NSLayoutConstraint.activate([
           expandedView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
           expandedView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
           expandedView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
       ])
   }
}
