//
//  NewsFeed.swift
//  DictionaryTest
//
//  Created by Thomas Cowern New on 4/27/22.
//

import SwiftUI

struct NewsFeed: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}
