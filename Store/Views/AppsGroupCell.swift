import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    private lazy var sectionName = UILabel(text: "Section", font: .systemFont(ofSize: 20, weight: .medium))
    
    private let horizontalController = AppsHorizontalViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(sectionName)
        sectionName.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: sectionName.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
