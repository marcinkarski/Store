//
//  DetailViewController.swift
//  Store
//
//  Created by Marcin Karski on 15/03/2019.
//  Copyright © 2019 Marcin Karski. All rights reserved.
//

import UIKit

class AppsDetailViewController: CollectionViewController {
    
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
    }
}
