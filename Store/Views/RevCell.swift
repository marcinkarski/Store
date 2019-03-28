import UIKit

class RevCell: UICollectionViewCell {
    
    let title = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 16))
    let author = UILabel(text: "Author", font: .systemFont(ofSize: 14))
    let stars = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    let body = UILabel(text: "Lorem ipsum", font: .systemFont(ofSize: 14), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        layer.cornerRadius = 8
        clipsToBounds = true
        
        let stackView = UIStackView(arrangedSubviews: [UIStackView(arrangedSubviews: [title, UIView(), author]), stars, body])
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
