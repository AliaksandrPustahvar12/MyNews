//
//  NewsViewModel.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 28.04.23.
//

import Foundation
import CoreData

class NewsViewModel: ObservableObject {
    
    private let service = NetworkService()
    
    private let dataBaseService = DataBaseService.shared
    
    @Published private(set) var articles = [ArticleDto]()
   
    func getArticles() async {
        guard let result = await service.fetchData() else { return }
        await MainActor.run {
            articles = result.articles
        }
    }
    
    func saveArticle(_ article: ArticleDto) {
        let articleToSave = Article(context: dataBaseService.context)
        articleToSave.title = article.title
        articleToSave.urlToImage = article.urlToImage
        articleToSave.publishedAt = article.publishedAt
        articleToSave.id = .init()
        dataBaseService.save(context: dataBaseService.context)
    }
    
    func dateFormatter(stringDate: String) -> Date {
        var formatDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date: Date = formatter.date(from: stringDate) {
            formatDate = date
        }
        return formatDate
    }
}
