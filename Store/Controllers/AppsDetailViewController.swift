//
//  DetailViewController.swift
//  Store
//
//  Created by Marcin Karski on 15/03/2019.
//  Copyright © 2019 Marcin Karski. All rights reserved.
//

import UIKit

class AppsDetailViewController: CollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var app: Result?
    
    var appId: String! {
        didSet {
            print("Here is my appId:", appId)
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchData(urlString: urlString) { (result: Search?, error) in
                let app = result?.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: PreviewCell.identifier)
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: ReviewCell.identifier)
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
            cell.app = app
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCell.identifier, for: indexPath) as! PreviewCell
            cell.prevController.app = self.app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.identifier, for: indexPath) as! ReviewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 280
        if indexPath.item == 0 {
            let approxCell = DetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            approxCell.app = app
            approxCell.layoutIfNeeded()
            let estimSize = approxCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            height = estimSize.height
        } else if indexPath.item == 1 {
            height = 500
        } else {
            height = 200
        }
        return .init(width: view.frame.width, height: height)
    }
}
