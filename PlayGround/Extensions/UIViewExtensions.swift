import Foundation
import UIKit

extension UIView {
    
    static func instantiateFromNib() -> Self? {
        func instanceFromNib<T: UIView>() -> T? {
            return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
        }

        return instanceFromNib()
    }
}
