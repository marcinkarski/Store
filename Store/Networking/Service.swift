import Foundation

class Service {
    static let shared = Service()
    
    func fetchData(completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
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
}
