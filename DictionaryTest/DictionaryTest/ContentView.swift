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
    @State var articlesArray: [Article] = []
    
    
    var body: some View {
        
        Text("Test")
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
                    if let articleTotal = newsFeed.articles?.count {
                        let articleTotal = articleTotal
                        print("😀😀 \(articleTotal) 😀😀")
                    }
                    
                    if let articles = newsFeed.articles {
                        
                        for article in articles {
                            
                            articlesArray.append(article)
                            print("😀😀 \(articlesArray) 😀😀")
                        }
                    }
                    
                    
                } catch {
                    print("Error during JSON decoding")
                }
            }
        }
        newsTask.resume()
    }
}
