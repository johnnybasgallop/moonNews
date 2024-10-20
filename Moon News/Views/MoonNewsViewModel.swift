import Foundation
import Combine

// MARK: - SpaceAPI ViewModel
class MoonNewsViewModel: ObservableObject {
    @Published var news: [SpaceData] = []
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    // Fetch data from the network
    func fetchNews() {
        NetworkManager.shared.fetchSpaceArticles { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    print("Successfully fetched \(articles.count) articles.")
                    self?.news = articles
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.news = [
                        SpaceData(id: 0, title: "error", url: "error", imageUrl: "error", newsSite: "error", summary: error.localizedDescription, publishedAt: "error", updatedAt: "error", featured: false, launches: ["error"], events: ["error"])
                    ]
                }
            }
        }
    }
}
