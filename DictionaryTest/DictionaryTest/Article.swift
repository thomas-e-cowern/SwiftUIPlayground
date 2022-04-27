//
//  Article.swift
//  DictionaryTest
//
//  Created by Thomas Cowern New on 4/27/22.
//

import Foundation

struct Article: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    static let exampleArticle = Article(source: Source.exampleSource, author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: "", content: "")
}
