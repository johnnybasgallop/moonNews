//
//  NewsArticle.swift
//  Moon News
//
//  Created by johnny basgallop on 18/07/2023.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    
    let title: String
    let imageUrl: String
    let siteName: String
    let summary: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text(siteName).italic()
            
            HStack(alignment: .center){
                
                AsyncImage(url: URL(string: imageUrl)){image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            placeholder:{
                ProgressView().frame(width: 200, height: 100, alignment: .center)
            }
            }
            Text(title)
                .font(.headline)
                .padding(8)
            
            Text(summary)
                .lineLimit(5)
                .font(.body)
                .padding(8)
        }
        .padding(.vertical)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}


#Preview{
    NewsArticle(title: "SpaceX rocket launch", imageUrl: "https://worldsteel.org/wp-content/uploads/worldsteel-SPaceX-Falcon-Rocket-HR.jpg", siteName: "TheRocketNewsOutlet.com", summary: "Today the spacex rocket 114564 was finally launched after weeks of testing")
}

