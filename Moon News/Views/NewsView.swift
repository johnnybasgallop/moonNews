//
//  NewsView.swift
//  Moon News
//
//  Created by johnny basgallop on 18/07/2023.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var viewModel : MoonNewsViewModel
    @Environment(\.openURL) var openURL
    private var textWidth = 300.0
    
    var body: some View {
        List {
            ForEach(viewModel.news) { news in
                
                    NewsArticle(title: news.title, imageUrl: news.imageUrl, siteName: news.newsSite, summary: news.summary)
                        .onTapGesture {
                            openURL(URL(string: news.url)!)
                        }.padding()
                    
                      Spacer()
                    .listRowSeparator(.hidden)
                
                    .listRowBackground(RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.clear)
                        .padding(
                        EdgeInsets(
                            top: 0,
                            leading: 0,
                            bottom: 0,
                            trailing: 0
                            )
                        )
                                )
            }
        }
        .listStyle(InsetGroupedListStyle())
        .refreshable {
            viewModel.fetchNews()
        }
    }
}

#Preview{
    NewsView().environmentObject(MoonNewsViewModel())
}

