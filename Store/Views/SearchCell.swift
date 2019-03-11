import UIKit

class SearchCell: UICollectionViewCell {
    
    var search: Result! {
        didSet {
            name.text = search?.trackName
            category.text = search.primaryGenreName
            rating.text = "Rating: \(search.averageUserRating ?? 0)"
            let url = URL(string: search.artworkUrl100)
            appIcon.sd_setImage(with: url)
            screenshot1.sd_setImage(with: URL(string: search.screenshotUrls[0]))
            if search.screenshotUrls.count > 1 {
                screenshot2.sd_setImage(with: URL(string: search.screenshotUrls[1]))
            }
            if search.screenshotUrls.count > 2 {
                screenshot3.sd_setImage(with: URL(string: search.screenshotUrls[2]))
            }
        }
    }
    
    lazy var appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    lazy var category: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    
    lazy var rating: UILabel = {
        let label = UILabel()
        label.text = "9M"
        return label
    }()
    
    lazy var getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var screenshot1 = makeShreenshot()
    lazy var screenshot2 = makeShreenshot()
    lazy var screenshot3 = makeShreenshot()
    
    private func makeShreenshot() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelsStackView = UIStackView(arrangedSubviews: [name, category, rating])
        labelsStackView.axis = .vertical
        
        let infoStackView = UIStackView(arrangedSubviews: [appIcon, labelsStackView, getButton])
        infoStackView.alignment = .center
        infoStackView.spacing = 16
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshot1, screenshot2, screenshot3])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let stackView = UIStackView(arrangedSubviews: [infoStackView, screenshotStackView])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
