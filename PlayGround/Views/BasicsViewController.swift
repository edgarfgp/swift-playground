import UIKit

class BasicsViewController: UIViewController {
    
    @IBOutlet weak var scrollableContent: UIView!
    
    fileprivate lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .red
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "I'm TextView"
        textView.textAlignment = .center
        return textView
    }()
    
    fileprivate lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Im label"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
    
        scrollableContent.addSubview(textView)
        scrollableContent.addSubview(label)
        setUpTextViewConstraints()
        setUpLabelConstraints()
    }
    
    fileprivate func setUpTextViewConstraints() {
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: scrollableContent.leadingAnchor, constant: 16),
            textView.topAnchor.constraint(equalTo: scrollableContent.topAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: scrollableContent.trailingAnchor, constant: -16),
            textView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    fileprivate func setUpLabelConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: scrollableContent.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: scrollableContent.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: scrollableContent.bottomAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
}
