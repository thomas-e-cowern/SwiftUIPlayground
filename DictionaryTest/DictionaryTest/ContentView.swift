//
//  ContentView.swift
//  DictionaryTest
//
//  Created by Thomas Cowern New on 4/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State var newsFeed = NewsFeed()
    @State var articles: [Article?] = []
    
    
    var body: some View {
        
//        List(newsFeed.articles!) {
//            Text($0.title!)
//        }
        ForEach(newsFeed.articles ?? Article.exampleArticle, id: \.self) { article in
            Text(article.title ?? "No Article Title")
        }
        
        
        Text("\(newsFeed.articles?[0].title ?? "No Article Title")")
            .padding()
            .onAppear {
                getTheNews()
            }
    }
    
    func getTheNews () {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=91918a83b185469c9f81f5af74ae59f9"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("URL is nil")
            return
        }
        
        let session = URLSession.shared
        
        let newsTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                
                do {
                    newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    print("😀😀😀 \(newsFeed) 😀😀😀")
                    
                    
                } catch {
                    print("Error during JSON decoding")
                }
            }
        }
        newsTask.resume()
    }
}
