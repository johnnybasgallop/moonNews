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
                CachedAsyncImage(url: URL(string: imageUrl),
                                 transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    else {
                        Color.black.frame(width: 200, height: 100, alignment: .center)
                    }
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
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "Code Palalce", imageUrl: "...", siteName: "CodePalaceNews", summary: "check out code palace because why not")
    }
}
