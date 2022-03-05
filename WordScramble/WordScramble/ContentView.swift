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
    
    // Error properties
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    @State private var showingError: Bool = false
    
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
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    // MARK:  Take the user entered word and perform checks for validity and add the user created word to the list for display if all checks pass
    func addNewWord () {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isWordOriginal(word: answer) else {
            wordError(title: "Word has already been used", message: "Please enter an original word")
            return
        }
        
        guard isLetterPresent(word: answer) else {
            wordError(title: "Invalid letters present", message: "Please only use letters from the root word")
            return
        }
        
        guard isActualWord(word: answer) else {
            wordError(title: "Not a real word", message: "Please enter onaly word from the dictionary")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    // MARK:  Start the game by loading the list and choosing a random word
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
    
    // MARK:  Check to ensure the word has not already been entered in the list
    func isWordOriginal (word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    // MARK:  Check to make sure the word can be made out of letters from the root word
    func isLetterPresent (word: String) -> Bool {
        var rootCopy = rootWord
        
        for letter in word {
            if let pos = rootCopy.firstIndex(of: letter)
            {
                rootCopy.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    // MARK:  Use UITextChecker to check word spelling and indentify if it is a real word.
    func isActualWord (word: String) -> Bool {
        
        // initialize checker
        let checker = UITextChecker()
        // get the size of the word
        let range = NSRange(location: 0, length: word.utf16.count)
        // determine if they are any spelling errors
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        // if no errors return true.  The word exists!
        return misspelledRange.location == NSNotFound
    }
    
    // MARK:  If validation fails, display the appropriate error
    func wordError (title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

// MARK:  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
