//
//  ContentView.swift
//  WordScramble
//
//  Created by Thomas Cowern New on 3/5/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK:  Properties
    @State private var usedWords: [String] = []
    @State private var rootWord: String = ""
    @State private var newWord: String = ""
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word:", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(usedWords, id: \.self){ word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit {
                addNewWord()
            }
            .onAppear {
                startGame()
            }
        }
    }
    
    func addNewWord () {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func startGame () {
   
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {

            if let contents = try? String(contentsOf: fileURL) {

                let allWords = contents.components(separatedBy: "\n")
                
                rootWord = allWords.randomElement() ?? "defaults"
            }
            
            return
        }
        
        fatalError("Could not load list of words from bundle")
    }
}

// MARK:  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
