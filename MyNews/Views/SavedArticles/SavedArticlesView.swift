//
//  SavedArticlesView.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 28.04.23.
//

import SwiftUI
import NukeUI

struct SavedArticlesView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.publishedAt, order: .reverse)]) private var savedArticles: FetchedResults<Article>
    
    var body: some View {
        List(savedArticles, id: \.self) { article in
            HStack {
                VStack {
                    LazyImage(url: URL(string: article.urlToImage ?? "")) { data in
                        if let image = data.image {
                            image.resizable().frame(width: 80, height: 50, alignment: .center).aspectRatio(contentMode: .fill)
                                .cornerRadius(6)
                        } else {
                            Color.gray
                        }
                    }
                    Spacer()
                }
                Spacer(minLength: 10)
                VStack {
                    Text(article.title ?? "")
                        .frame(alignment: .leading)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                    
                    Spacer()
                    HStack {
                        Spacer()
                        Text(viewModel.dateFormatter(stringDate: article.publishedAt ?? "").formatted(date: .long, time: .shortened))
                            .font(.system(size: 14, weight: .light))
                    }
                }
            }
        }
    }
}

struct SavedArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedArticlesView()
    }
}