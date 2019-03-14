import Foundation

class Service {
    static let shared = Service()
    
    func fetchSearch(searchText: String, completion: @escaping (Search?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&entity=software"
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion: @escaping (Apps?, Error?) -> ()) {
        fetch(url: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/09/explicit.json", completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (Apps?, Error?) -> ()) {
        fetch(url: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/09/explicit.json", completion: completion)
    }
    
    func fetch(url string: String, completion: @escaping (Apps?, Error?) -> Void) {
        fetchData(urlString: string, completion: completion)
    }
    
    func fetchAppsHeader(completion: @escaping ([Header]?, Error?) -> Void) {
        let headerApps = "https://api.letsbuildthatapp.com/appstore/social"
        fetchData(urlString: headerApps, completion: completion)
    }
    
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            do {
                let apps = try JSONDecoder().decode(T.self, from: data)
                completion(apps, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
}
