import Foundation

struct Apps: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResults]
}

struct FeedResults: Decodable {
    let id, name, artistName, artworkUrl100: String
}
