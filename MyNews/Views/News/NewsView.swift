//
//  NewsView.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 28.04.23.
//

import SwiftUI
import NukeUI
import CoreData

struct NewsView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.publishedAt, order: .reverse)]) private var savedArticles: FetchedResults<Article>
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.articles.isEmpty {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    List(viewModel.articles, id: \.self) { article in
                        HStack {
                            VStack {
                                LazyImage(url: URL(string: article.urlToImage)) { data in
                                    Group {
                                        if let image = data.image {
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .cornerRadius(6)
                                        } else {
                                            ProgressView()
                                                .progressViewStyle(.circular)
                                        }
                                    }.frame(width: 80, height: 50, alignment: .center)
                                }
                                Spacer()
                            }
                            Spacer(minLength: 10)
                            VStack {
                                Text(article.title)
                                    .frame(alignment: .leading)
                                    .font(.system(size: 18, weight: .medium, design: .rounded))
                                
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text(article.publishedAt.asDate.formatted(date: .long, time: .shortened))
                                        .font(.system(size: 14, weight: .light))
                                }
                            }
                            VStack {
                                Spacer()
                                if  savedArticles.contains {$0.title == article.title} {
                                    Text("Already\n saved ")
                                        .foregroundColor(Color.red)
                                        .font(.system(size: 14, weight: .medium))
                                } else {
                                    Button("Save") {
                                        viewModel.saveArticle(article)
                                    }
                                    .foregroundColor(Color.blue)
                                    .font(.system(size: 16, weight: .medium))
                                }
                            }.padding(.leading)
                        }
                    }
                }
            }
            .task {
                await viewModel.getArticles()
            }
            .navigationTitle("News")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
