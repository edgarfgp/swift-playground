import UIKit
import LBTATools

class MainViewController: UIViewController {
      
    var dashBoardList = ["BasicsView", "CustomView", "TableView"]
    
    @IBOutlet weak var dashBoardCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Dashboard"
        
        let widht = (view.frame.width - 20) / 3
        let layout = dashBoardCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: widht, height: widht)
    }
}

extension MainViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let viewController = dashBoardList[indexPath.row]
        
        if viewController  == "BasicsView" {
            let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: BasicsViewController.self)) as! BasicsViewController
                   navigationController?.pushViewController(newViewController, animated: true)
        }else if viewController  == "CustomView" {
            let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CustomViewController.self)) as! CustomViewController
            navigationController?.pushViewController(newViewController, animated: true)
        }else {
            
            let newViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: TodoViewController.self)) as! TodoViewController
            navigationController?.pushViewController(newViewController, animated: true)
        }
        
        
    }
    
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
