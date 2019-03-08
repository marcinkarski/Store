import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appsViewController = UIViewController()
        appsViewController.view.backgroundColor = .white
        appsViewController.navigationItem.title = "Apps"
        let appsNavController = UINavigationController(rootViewController: appsViewController)
        appsNavController.tabBarItem.title = "Today"
        appsNavController.tabBarItem.image = UIImage(named: "apps")
        appsNavController.navigationBar.prefersLargeTitles = true
        
        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        searchViewController.navigationItem.title = "Search"
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = UIImage(named: "search")
        searchNavController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [appsNavController, searchNavController]
    }
}
