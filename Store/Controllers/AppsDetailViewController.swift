//
//  DetailViewController.swift
//  Store
//
//  Created by Marcin Karski on 15/03/2019.
//  Copyright © 2019 Marcin Karski. All rights reserved.
//

import UIKit

class AppsDetailViewController: CollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var appId: String! {
        didSet {
            print("Here is my appId:", appId)
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchData(urlString: urlString) { (result: Search?, error) in
                print(result?.results.first?.releaseNotes)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
