import UIKit
import LBTATools

class MainViewController: UIViewController {
        
    @IBOutlet weak var basicControls: UIView!
    
    @IBOutlet weak var customControls: UIView!
    
    @IBOutlet weak var containerView: UIView!
    
    fileprivate lazy var loginExample: UIView = {
        let login = UIView()
        login.backgroundColor = .systemBlue
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()
    
    fileprivate lazy var loginExampleText: UILabel = {
        let loginText = UILabel()
        loginText.translatesAutoresizingMaskIntoConstraints = false
        loginText.text = "Login Sample"
        loginText.textColor = .white
        return loginText
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Dashboard"
        
        containerView.addSubview(loginExample)
        loginExample.addSubview(loginExampleText)

        let basicGesture = UITapGestureRecognizer(target: self, action:  #selector(self.navigateToBasic))
        let customGesture = UITapGestureRecognizer(target: self, action: #selector(self.navigateToCustom))
        let loginGesture = UITapGestureRecognizer(target: self, action: #selector(self.navigateToLogin))
               
        basicControls.addGestureRecognizer(basicGesture)
        customControls.addGestureRecognizer(customGesture)
        loginExample.addGestureRecognizer(loginGesture)
                
        basicControls.applyCustomStyle()
        customControls.applyCustomStyle()
        loginExample.applyCustomStyle()
        
        setUpContraintsForLoginSample()
        
    }
    
    @objc func navigateToBasic(sender : UITapGestureRecognizer) {
        let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: BasicsViewController.self)) as! BasicsViewController
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func navigateToCustom(sender : UITapGestureRecognizer) {
        let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CustomViewController.self)) as! CustomViewController
        navigationController?.pushViewController(newViewController, animated: true)
        }
    
    @objc func navigateToLogin(sender: UITapGestureRecognizer){
        let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: WelcomeViewController.self)) as! WelcomeViewController
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func setUpContraintsForLoginSample() {
        NSLayoutConstraint.activate([
            loginExample.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            loginExample.topAnchor.constraint(equalTo: customControls.bottomAnchor, constant: 16),
            loginExample.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            loginExample.heightAnchor.constraint(equalToConstant: 50)
        ])
        loginExampleText.centerInSuperview()
    }

}
