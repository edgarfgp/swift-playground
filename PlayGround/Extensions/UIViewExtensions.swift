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
}
