//
//  Mission.swift
//  Moonshot
//
//  Created by Thomas Cowern New on 3/8/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apallo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
}
