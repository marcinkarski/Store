import UIKit

class AppRowCell: UICollectionViewCell {

    lazy var appIcon = UIImageView(cornerRadius: 12)
    lazy var getButton = UIButton(title: "GET")
    lazy var nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 18, weight: .medium))
    lazy var companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 14, weight: .medium))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        appIcon.backgroundColor = .lightGray
        appIcon.constrainWidth(constant: 60)
        appIcon.constrainHeight(constant: 60)
        getButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 16
        getButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel])
        labelsStackView.axis = .vertical
        let stackView = UIStackView(arrangedSubviews: [appIcon, labelsStackView, getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
