import UIKit
import SDWebImage

class SearchViewController: CollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Type in what you are looking for above."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(white: 0.5, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        fetchSearch()
        setupSearchBar()
    }
    
    private func setup() {
        collectionView.backgroundColor = .white
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        collectionView.addSubview(label)
        label.fillSuperview(padding: .init(top: 50, left: 20, bottom: 0, right: 20))
    }
    
    private func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchData(searchText: searchText) { (result, error) in
                self.search = result
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    private var search = [Result]()
    
    private func fetchSearch() {
        Service.shared.fetchData(searchText: "twitter") { (result, error) in
            if let error = error {
                print("Failed to fetch search result", error)
                return
            }
            self.search = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
        cell.search = self.search[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        label.isHidden = search.count != 0
        return search.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 320)
    }
}
