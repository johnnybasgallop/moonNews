//
//  APIClient.swift
//  Moon News
//
//  Created by johnny basgallop on 17/07/2023.
//
//API Endpoint: https://api.spaceflightnewsapi.net/v4/articles/

import Foundation

struct SpaceData : Codable, Identifiable {
    var id: Int
    var title : String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}

@MainActor class SpaceAPI : ObservableObject {
    @Published var news: [SpaceData] = []
    
    func getData() {
        
//        Check the URL exists
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=15")
        else {return}
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
//            Check if there is any data
            
            guard let data = data else {
//                No data
                guard let tempError = error?.localizedDescription else{return}
                
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, title: tempError, url: "Error", imageUrl: "Error", newsSite: "Error", summary: "Could not show data due to lack of internet connection, re-establish connection and try again", publishedAt: "Error")]
                }
                return
            }
            
//            There is Data!
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
            
            DispatchQueue.main.async {
                print("loaded new data succesfully, Articles: \(spaceData.count) ")
                self.news = spaceData
            }
        }.resume()
        
        
    }
}
