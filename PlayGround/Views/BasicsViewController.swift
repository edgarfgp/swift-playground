import UIKit

class BasicsViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    fileprivate lazy var pickerData: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    
    fileprivate lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Im label"
        label.textAlignment = .center
        label.backgroundColor = .yellow
        return label
    }()
    
    fileprivate lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("I'm a button", for: .normal)
        button.isUserInteractionEnabled = true
        button.backgroundColor = .lightGray
        button.applyCustomStyle()
        return button
    }()
    
    fileprivate lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "I'm a textField"
        textField.textAlignment = .center
        textField.backgroundColor = .red
        return textField
    }()
    
    fileprivate lazy var switchElement : UISwitch = {
        let switchElement = UISwitch()
        switchElement.translatesAutoresizingMaskIntoConstraints = false
        switchElement.setOn(true, animated: true)
        switchElement.backgroundColor = .magenta
        return  switchElement
    }()
    
    fileprivate lazy var pickerElement: UIPickerView = {
        let pickerElelement = UIPickerView()
        pickerElelement.translatesAutoresizingMaskIntoConstraints = false
        pickerElelement.isUserInteractionEnabled = true
        pickerElelement.delegate = self
        pickerElelement.dataSource = self
        pickerElelement.backgroundColor = .cyan
        return pickerElelement
    }()
    
    fileprivate lazy var sliderElement : UISlider = {
        let sliderElement = UISlider()
        sliderElement.translatesAutoresizingMaskIntoConstraints = false
        sliderElement.backgroundColor = .purple
        return sliderElement
    }()
    
    fileprivate lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dollar")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .orange
        return image
    }()
    
    override func viewDidLoad() {
        
        navigationItem.title = "Basic controls"
    
        contentView.addSubview(label)
        contentView.addSubview(button)
        contentView.addSubview(textField)
        contentView.addSubview(switchElement)
        contentView.addSubview(pickerElement)
        contentView.addSubview(sliderElement)
        contentView.addSubview(image)
        
        setUpLabelConstraints()
        setUpButtonConstraints()
        setUpEditTextConstraints()
        setUpSwitchElementConstraints()
        setUpPickerElementConstraints()
        setUpSliderElementConstraints()
        setUpImageElementConstraints()
    }
    
    fileprivate func setUpLabelConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)        ])
    }
        
    fileprivate func setUpButtonConstraints() {
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    fileprivate func setUpEditTextConstraints() {
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    fileprivate func setUpSwitchElementConstraints() {
        NSLayoutConstraint.activate([
            switchElement.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            switchElement.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            switchElement.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    fileprivate func setUpPickerElementConstraints() {
           NSLayoutConstraint.activate([
               pickerElement.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
               pickerElement.topAnchor.constraint(equalTo: switchElement.bottomAnchor, constant: 16),
               pickerElement.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           ])
       }
    
    fileprivate func setUpSliderElementConstraints() {
        NSLayoutConstraint.activate([
            sliderElement.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sliderElement.topAnchor.constraint(equalTo: pickerElement.bottomAnchor, constant: 16),
            sliderElement.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    fileprivate func setUpImageElementConstraints() {
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.topAnchor.constraint(equalTo: sliderElement.bottomAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant:  70)
        ])
    }
}

extension BasicsViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
