import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    private lazy var sectionName = UILabel(text: "Section", font: .systemFont(ofSize: 22, weight: .medium))
    
    private let horizontalController = AppsHorizontalViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(sectionName)
        sectionName.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 16, bottom: 8, right: 0))
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: sectionName.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
