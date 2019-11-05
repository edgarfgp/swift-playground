import UIKit
import LBTATools

class MainViewController: UIViewController {
        
    @IBOutlet weak var basicControls: UIView!
    
    @IBOutlet weak var customControls: UIView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var tableViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Dashboard"

        let basicGesture = UITapGestureRecognizer(target: self, action:  #selector(self.navigateToBasic))
        let customGesture = UITapGestureRecognizer(target: self, action: #selector(self.navigateToCustom))
               
        basicControls.addGestureRecognizer(basicGesture)
        customControls.addGestureRecognizer(customGesture)
        
        tableViewButton.applyCustomStyle()
                
        basicControls.applyCustomStyle()
        customControls.applyCustomStyle()
                
    }
    
    @IBAction func tableViewTapped(_ sender: Any) {
         let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: SettingsViewController.self)) as! SettingsViewController
                   navigationController?.pushViewController(newViewController, animated: true)
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
