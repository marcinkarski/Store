import UIKit

class AppsHeader: UICollectionReusableView {
    
    let headerController = AppsHeaderController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerController.view)
        headerController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
