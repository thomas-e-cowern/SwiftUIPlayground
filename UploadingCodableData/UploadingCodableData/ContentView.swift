//
//  ContentView.swift
//  UploadingCodableData
//
//  Created by Thomas Cowern New on 8/12/22.
//

import SwiftUI

struct ContentView: View {
    
    let movieStar: MovieStar
    
    var body: some View {
        Button("Send Data") {
            let movies = ["The Lord of the Rings", "Elizabeth"]
            let cate = MovieStar(name: "Cate Blanchett", movies: movies)
            let url = URL(string: "https://reqres.in/api/users")!
            
            movieStar.upload(cate, to: url)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Testing....")
    }
}
