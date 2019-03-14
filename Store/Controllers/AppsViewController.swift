import UIKit

class AppsViewController: CollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.color = .gray
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.identifier)
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        fetchData()
        
        view.addSubview(activityIndicator)
        activityIndicator.fillSuperview()
    }
    
    var headerApps = [Header]()
    
    var feedSections = [Apps]()
    
    private func fetchData() {
        
        var section1: Apps?
        var section2: Apps?
        
        let dispatchGroup = DispatchGroup()
        
            dispatchGroup.enter()
            Service.shared.fetchGames { (apps, error) in
                dispatchGroup.leave()
                section1 = apps
            }
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing { (apps, error) in
            dispatchGroup.leave()
            section2 = apps
        }
        dispatchGroup.enter()
        Service.shared.fetchAppsHeader { (apps, error) in
            dispatchGroup.leave()
//            apps?.forEach({print($0.name)})
            self.headerApps = apps ?? []
        }
        
        dispatchGroup.notify(queue: .main) {
            
            self.activityIndicator.stopAnimating()
            if let section = section1 {
                self.feedSections.append(section)
            }
            if let section = section2 {
                self.feedSections.append(section)
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! AppsHeader
        header.headerController.items = self.headerApps
        header.headerController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedSections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.identifier, for: indexPath) as! AppsGroupCell
        let apps = feedSections[indexPath.item]
        cell.sectionName.text = apps.feed.title
        cell.horizontalController.items = apps
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    }
}
