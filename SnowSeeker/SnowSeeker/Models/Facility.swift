//
//  Facility.swift
//  SnowSeeker
//
//  Created by Thomas Cowern New on 4/18/22.
//

import SwiftUI

struct Facility: Identifiable {
    let id = UUID()
    var name: String
    
    private let icons = [
        "Accommodation": "house",
        "Beginners": "1.circle",
        "Cross-country": "map",
        "Eco-friendly": "leaf.arrow.circlepath",
        "Family": "person.3"
    ]
    
    private let descriptions = [
        "Accommodation": "This resort has on site accomodations",
        "Beginners": "This resort offers ski schools",
        "Cross-country": "This resort offers cross-country skiing",
        "Eco-friendly": "This resort is environmentally friendly",
        "Family": "This resort is family friendly"
    ]
    
    var icon: some View {
        if let iconName = icons[name] {
            return Image(systemName: iconName)
                .accessibilityLabel(name)
                .foregroundColor(.secondary)
        } else {
            fatalError("Unknown facility type \(name)")
        }
    }
    
    var description: String {
        if let message = descriptions[name] {
            return message
        } else {
            fatalError("Unknown description type \(name)")
        }
    }
}
