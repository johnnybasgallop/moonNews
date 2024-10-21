import Foundation

class NetworkManager {
    
    private let baseURL = "https://api.spaceflightnewsapi.net/v4/articles?limit=15"
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchSpaceArticles(completion: @escaping (Result<[SpaceData], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(decodedResponse.results))
            } catch {
                completion(.failure(NetworkError.decodingError(error)))
            }
        }.resume()
    }
}
