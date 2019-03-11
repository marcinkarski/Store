import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayNavController = makeNavController(viewController: UIViewController(), title: "Today", image: "today")
        let appsNavController = makeNavController(viewController: AppsViewController(), title: "Apps", image: "apps")
        let searchNavController = makeNavController(viewController: SearchViewController(), title: "Search", image: "search")
        
        viewControllers = [todayNavController, appsNavController, searchNavController]
    }
    
    private func makeNavController(viewController: UIViewController, title: String, image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)
        navController.navigationBar.prefersLargeTitles = true
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        return navController
    }
}
