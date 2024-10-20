import Foundation

struct SpaceData: Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
    var updatedAt: String
    var featured: Bool
    var launches: [String]
    var events: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case url
        case imageUrl = "image_url"
        case newsSite = "news_site"
        case summary
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case featured
        case launches
        case events
    }
}

// MARK: - Wrapper for API Response
struct APIResponse: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [SpaceData]
}
