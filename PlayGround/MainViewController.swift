import UIKit
import LBTATools

class MainViewController: UIViewController {
      
    var dashBoardList = ["Basic Controls", "Custom Views", "Table View"]
    
    @IBOutlet weak var dashBoardCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Dashboard"
        
        let widht = (view.frame.width - 20) / 3
        let layout = dashBoardCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: widht, height: widht)
        
//
//        let basicGesture = UITapGestureRecognizer(target: self, action:  #selector(self.navigateToBasic))
//        let customGesture = UITapGestureRecognizer(target: self, action: #selector(self.navigateToCustom))
               
//        basicControls.addGestureRecognizer(basicGesture)
//        customControls.addGestureRecognizer(customGesture)
//
//        tableViewButton.applyCustomStyle()
//
//        basicControls.applyCustomStyle()
//        customControls.applyCustomStyle()
                
    }
    
    @IBAction func tableViewTapped(_ sender: Any) {
         let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: TodoViewController.self)) as! TodoViewController
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

extension MainViewController : UICollectionViewDelegate {
    
}

extension MainViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashBoardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dashBoardCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = dashBoardList[indexPath.row]
        }
        
        return cell
    }
}
