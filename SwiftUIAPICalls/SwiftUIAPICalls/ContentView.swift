//
//  ContentView.swift
//  SwiftUIAPICalls
//
//  Created by Thomas Cowern New on 4/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id: \.self) { course in
                    HStack {
                        Image("")
                            .frame(width: 130, height: 130)
                            .background(Color.gray)
                        Text(course.name)
                            .bold()
                    }
                    .padding(3)
                }
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
