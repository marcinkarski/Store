import UIKit

class ReviewCell: UICollectionViewCell {
    
    var revController = ReviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(revController.view)
        revController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
