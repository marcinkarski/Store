//
//  DetailCell.swift
//  Store
//
//  Created by Marcin Karski on 18/03/2019.
//  Copyright © 2019 Marcin Karski. All rights reserved.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
    lazy var appIcon = UIImageView(cornerRadius: 16)
    
    lazy var name = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 22), numberOfLines: 2)
    
    lazy var priceButton = UIButton(title: "$5.00")
    
    lazy var whatsNew = UILabel(text: "What's New", font: .boldSystemFont(ofSize: 22))
    
    lazy var releaseNotes = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        appIcon.backgroundColor = .gray
        appIcon.constrainWidth(constant: 120)
        appIcon.constrainHeight(constant: 120)
        priceButton.backgroundColor = .blue
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.constrainWidth(constant: 80)
        priceButton.constrainHeight(constant: 32)
        priceButton.layer.cornerRadius = 32 / 2
        let labelStackView = UIStackView(arrangedSubviews: [name, UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()])
        labelStackView.axis = .vertical
        labelStackView.spacing = 16
        let topStackView = UIStackView(arrangedSubviews: [appIcon, labelStackView])
        topStackView.spacing = 16
        let stackView = UIStackView(arrangedSubviews: [topStackView, whatsNew, releaseNotes])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
