import Foundation

class Service {
    static let shared = Service()
    
    func fetchData(searchText: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error", error)
                completion([], nil)
                return
            }
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(Search.self, from: data)
                completion(searchResult.results, nil)
            } catch {
                print("Failed to decode json")
                completion([], error)
            }
            }.resume()
    }
    
    func fetchGames(completion: @escaping (Apps?, Error?) -> ()) {
        fetch(url: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/09/explicit.json", completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (Apps?, Error?) -> ()) {
        fetch(url: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/09/explicit.json", completion: completion)
    }
    
    func fetch(url string: String, completion: @escaping (Apps?, Error?) -> Void) {
        guard let url = URL(string: string) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            do {
                let apps = try JSONDecoder().decode(Apps.self, from: data)
                completion(apps, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
    
    func fetchAppsHeader(completion: @escaping ([Header]?, Error?) -> Void) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            do {
                let apps = try JSONDecoder().decode([Header].self, from: data)
                completion(apps, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
}
