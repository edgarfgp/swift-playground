import Foundation
import UIKit

extension UIView {
    func applyCustomStyle() {
        self.layer.cornerRadius = 4
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius =  4
        self.layer.masksToBounds = true
    }
    
    static func instantiateFromNib() -> Self? {
        func instanceFromNib<T: UIView>() -> T? {
            return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
        }
        return instanceFromNib()
    }
}
