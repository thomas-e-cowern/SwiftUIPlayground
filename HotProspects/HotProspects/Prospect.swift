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
    var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init () {
        self.people = []
    }
}


