import UIKit

class ViewController: UIViewController {
    
    private lazy var scrollContainer: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var headerContainer : UIView = {
        let view  = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 4
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        return view
    }()
    
    private lazy var basicTitle : UILabel = {
        let basic = UILabel()
        basic.translatesAutoresizingMaskIntoConstraints = false
        basic.text = "Basics Elements"
        basic.textAlignment = .center
        return basic
    }()
    
    private lazy var headerContainer2 : UIView = {
           let view  = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.backgroundColor = .yellow
           return view
       }()
    
    private lazy var headerContainer3 : UIView = {
        let view  = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        headerContainer.addGestureRecognizer(gesture)
        
        view.addSubview(scrollContainer)
        scrollContainer.addSubview(containerView)
        containerView.addSubview(headerContainer)
        headerContainer.addSubview(basicTitle)
        containerView.addSubview(headerContainer2)
        containerView.addSubview(headerContainer3)

        setUpscrollContainerConstraints()
        setUpContainerViewContraints()
        setUpPageHeaderContainerConstraints()
        setUpPageHeaderContainer2Constraints()
        setUpPageHeaderContainer3Constraints()
    }
    
    fileprivate func setUpNavigationBar() {
        view.backgroundColor = .white
        navigationItem.title = "Playground"
      }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
//        let basicsViewController = BasicsViewController()
//        basicsViewController.title = "Basic Elements"
//        basicsViewController.view.backgroundColor = .white
//        navigationController?.pushViewController(basicsViewController, animated: true)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Basics", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "basicsViewController") as! BasicsViewController
        newViewController.title = "Basic Elements"
        navigationController?.pushViewController(newViewController, animated: true)
    }
      
    fileprivate func setUpscrollContainerConstraints(){
           NSLayoutConstraint.activate([
               scrollContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
               scrollContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
               scrollContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               scrollContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
           ])
       }
    
    fileprivate func setUpContainerViewContraints() {
        let heightAnchor = containerView.heightAnchor.constraint(equalTo: scrollContainer.heightAnchor, constant: 0)
        heightAnchor.priority = UILayoutPriority(250)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor),
            containerView.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollContainer.widthAnchor),
            heightAnchor,
           ])
       }
    
    fileprivate func setUpPageHeaderContainerConstraints(){
        NSLayoutConstraint.activate([
            headerContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            headerContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            headerContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            headerContainer.heightAnchor.constraint(equalToConstant: 70),
            
            basicTitle.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
            basicTitle.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor),
            basicTitle.topAnchor.constraint(equalTo: headerContainer.topAnchor),
            basicTitle.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor)
            
        ])
    }
    
    fileprivate func setUpPageHeaderContainer2Constraints(){
        NSLayoutConstraint.activate([
            headerContainer2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            headerContainer2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            headerContainer2.topAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: 16),
            headerContainer2.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    fileprivate func setUpPageHeaderContainer3Constraints(){
           NSLayoutConstraint.activate([
               headerContainer3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
               headerContainer3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
               headerContainer3.topAnchor.constraint(equalTo: headerContainer2.bottomAnchor, constant: 16),
               headerContainer3.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
               headerContainer3.heightAnchor.constraint(equalToConstant: 500)
           ])
       }
}
