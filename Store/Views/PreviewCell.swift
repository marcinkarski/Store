import UIKit

class PreviewCell: UICollectionViewCell {
    
    let label = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 24))
    
    let prevController = PrevController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        addSubview(prevController.view)
        prevController.view.anchor(top: label.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
