//
//  Prospect.swift
//  HotProspects
//
//  Created by Thomas Cowern New on 3/24/22.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = ""
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init () {        
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }

        self.people = []
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}


