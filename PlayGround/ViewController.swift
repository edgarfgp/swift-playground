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
        view.backgroundColor = .blue
        return view
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
        
        view.backgroundColor = .white
        
        navigationItem.title = "Playground"
                        
        view.addSubview(scrollContainer)
        scrollContainer.addSubview(containerView)
        containerView.addSubview(headerContainer)
        containerView.addSubview(headerContainer2)
        containerView.addSubview(headerContainer3)

        setUpscrollContainerConstraints()
        setUpContainerViewContraints()
        setUpPageHeaderContainerConstraints()
        setUpPageHeaderContainer2Constraints()
        setUpPageHeaderContainer3Constraints()
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
        heightAnchor.priority = UILayoutPriority(550)
        
           NSLayoutConstraint.activate([
               containerView.widthAnchor.constraint(equalTo: scrollContainer.widthAnchor),
               heightAnchor,
               containerView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor),
               containerView.topAnchor.constraint(equalTo: scrollContainer.topAnchor),
           ])
       }
    
    fileprivate func setUpPageHeaderContainerConstraints(){
        NSLayoutConstraint.activate([
            headerContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            headerContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            headerContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            headerContainer.heightAnchor.constraint(equalToConstant: 570)
        ])
    }
    
    fileprivate func setUpPageHeaderContainer2Constraints(){
        NSLayoutConstraint.activate([
            headerContainer2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            headerContainer2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            headerContainer2.topAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: 16),
            headerContainer2.heightAnchor.constraint(equalToConstant: 570)
        ])
    }
    
    fileprivate func setUpPageHeaderContainer3Constraints(){
           NSLayoutConstraint.activate([
               headerContainer3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
               headerContainer3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
               headerContainer3.topAnchor.constraint(equalTo: headerContainer2.bottomAnchor, constant: 16),
               headerContainer3.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
               headerContainer3.heightAnchor.constraint(equalToConstant: 270)
           ])
       }
}
