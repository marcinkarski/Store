import Foundation

struct Search: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String
    let screenshotUrls: [String]
}
