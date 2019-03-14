import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let company = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 14))
    let text = UILabel(text: "Keeping up with friends is faster than ever.", font: .systemFont(ofSize: 20, weight: .regular))
    let image = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        text.numberOfLines = 0
        image.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [company, text, image])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 16, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
