//
//  NewsModel.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 28.04.23.
//

import Foundation

struct News: Decodable {
    var articles: [ArticleDto]
}
struct ArticleDto: Decodable, Hashable {
    var title: String
    var publishedAt: String
    var urlToImage: String
}
