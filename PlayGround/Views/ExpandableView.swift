
import Foundation
import UIKit

class ExpandableView: UIView {
        
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var arrowImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
      
    //common func to init our view
    private func initialize() {
        self.backgroundColor = .red
    }
}
