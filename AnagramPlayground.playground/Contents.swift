import UIKit

var greeting = "Hello, playground"

func countChars(word: String?) -> [Character: Int]? {
    guard let word = word, word != "" else {
        return nil
    }
    var dictionary = [Character: Int]()
    
    for char in word {
        if let currentValue = dictionary[char] {
            dictionary.updateValue(currentValue + 1, forKey: char)
        } else {
            dictionary[char] = 1
        }
    }
    return dictionary
}

countChars(word: "garden")
countChars(word: "danger")

