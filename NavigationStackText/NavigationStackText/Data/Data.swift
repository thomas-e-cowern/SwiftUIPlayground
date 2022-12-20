//
//  Data.swift
//  NavigationStackText
//
//  Created by Thomas Cowern on 12/20/22.
//

import Foundation

struct Data {
    var platforms: [Platform] = [.init(name: "XBox", imageName: "xbox-logo", color: .green),
                                 .init(name: "Playstation", imageName: "playstation-logo", color: .indigo),
                                 .init(name: "PC", imageName: "pc-logo", color: .gray),
                                 .init(name: "IPhone", imageName: "iphone-logo", color: .black)]
    
    var games: [Game] = [.init(name: "Minecraft", rating: "92"),
                         .init(name: "God of war", rating: "89"),
                         .init(name: "Fortnite", rating: "99"),
                         .init(name: "Madden 2023", rating: "93")]

}


