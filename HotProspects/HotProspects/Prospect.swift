//
//  Prospect.swift
//  HotProspects
//
//  Created by Thomas Cowern New on 3/24/22.
//

import Foundation

class Prospect: Identifiable, Codable, Comparable, Hashable {
    
    var id: UUID = UUID()
    var name: String = ""
    var emailAddress: String = ""
    fileprivate(set) var isContacted: Bool = false
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(emailAddress)
        hasher.combine(isContacted)
    }
    
    static func == (lhs: Prospect, rhs: Prospect) -> Bool {
        return lhs.name == rhs.name && lhs.emailAddress == rhs.emailAddress && lhs.isContacted == rhs.isContacted
    }
    
    
    static func <(lhs: Prospect, rhs: Prospect) -> Bool {
        return lhs.name < rhs.name
    }
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    
    init () {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
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
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func add (_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
}


