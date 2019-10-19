import UIKit

class MainViewController: UIViewController {
        
    @IBOutlet weak var basicControls: UIView!
    
    @IBOutlet weak var customControls: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Dashboard"
        
        basicControls.applyCustomStyle()
        customControls.applyCustomStyle()
        
        let basicGesture = UITapGestureRecognizer(target: self, action:  #selector(self.navigateToBasic))
        let customGesture = UITapGestureRecognizer(target: self, action: #selector(self.navigateToCustom))
        
        basicControls.addGestureRecognizer(basicGesture)
        customControls.addGestureRecognizer(customGesture)
    }
    
    @objc func navigateToBasic(sender : UITapGestureRecognizer) {
        let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: BasicsViewController.self)) as! BasicsViewController
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func navigateToCustom(sender : UITapGestureRecognizer) {
        let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CustomViewController.self)) as! CustomViewController
        navigationController?.pushViewController(newViewController, animated: true)
        }

}
