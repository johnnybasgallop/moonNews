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
    }
}


//struct previewExamples{
//    static func examples() -> [SpaceData] {
//        [
//            SpaceData(id: 0, title: "Final SpaceX Launch", url: "", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo3PDrso6tMje32sUxtZhbvrWpBrYgKUDa7w&s", newsSite: "TheRocketClub", summary: "This final spaceX launch represents a huge step not only for the company, but also for mankind", publishedAt: "24/10/23", updatedAt: "25/10/23", featured: false, launches: [""], events: [""]),
//            SpaceData(id: 0, title: "Final SpaceX Launch", url: "", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo3PDrso6tMje32sUxtZhbvrWpBrYgKUDa7w&s", newsSite: "TheRocketClub", summary: "This final spaceX launch represents a huge step not only for the company, but also for mankind", publishedAt: "24/10/23", updatedAt: "25/10/23", featured: false, launches: [""], events: [""]),
//            SpaceData(id: 0, title: "Final SpaceX Launch", url: "", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo3PDrso6tMje32sUxtZhbvrWpBrYgKUDa7w&s", newsSite: "TheRocketClub", summary: "This final spaceX launch represents a huge step not only for the company, but also for mankind", publishedAt: "24/10/23", updatedAt: "25/10/23", featured: false, launches: [""], events: [""]),
//            SpaceData(id: 0, title: "Final SpaceX Launch", url: "", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo3PDrso6tMje32sUxtZhbvrWpBrYgKUDa7w&s", newsSite: "TheRocketClub", summary: "This final spaceX launch represents a huge step not only for the company, but also for mankind", publishedAt: "24/10/23", updatedAt: "25/10/23", featured: false, launches: [""], events: [""]),
//            SpaceData(id: 0, title: "Final SpaceX Launch", url: "", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo3PDrso6tMje32sUxtZhbvrWpBrYgKUDa7w&s", newsSite: "TheRocketClub", summary: "This final spaceX launch represents a huge step not only for the company, but also for mankind", publishedAt: "24/10/23", updatedAt: "25/10/23", featured: false, launches: [""], events: [""])
//        ]
//    }
//}

// MARK: - Wrapper for API Response
struct APIResponse: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [SpaceData]
}
