
import Foundation
import UIKit

class ExpandableView: UIView {
    
    lazy var containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow_down")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
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
        self.addSubview(containerView)
        containerView.addSubview(arrowImage)
        self.applyCustomStyle()
        setUpContraintsContainerView()
        setUpContraintsArrowImage()
    }
    
    func setUpContraintsContainerView() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 70)

        ])
    }
    
    func setUpContraintsArrowImage() {
           NSLayoutConstraint.activate([
               arrowImage.heightAnchor.constraint(equalToConstant: 24),
               arrowImage.widthAnchor.constraint(equalToConstant: 24),
               arrowImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
               arrowImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
           ])
       }
}
