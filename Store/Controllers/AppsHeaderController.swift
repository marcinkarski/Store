import UIKit

class AppsHeaderController: SnapController, UICollectionViewDelegateFlowLayout {
    
    var items = [Header]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: AppsHeaderCell.identifier)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderCell.identifier, for: indexPath) as! AppsHeaderCell
        let item = items[indexPath.item]
        cell.company.text = item.name
        cell.text.text = item.tagline
        cell.image.sd_setImage(with: URL(string: item.imageUrl))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 48, height: view.frame.height)
    }
}
