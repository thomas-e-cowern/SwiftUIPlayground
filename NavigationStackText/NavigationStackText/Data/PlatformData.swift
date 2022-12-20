//
//  PlatformData.swift
//  NavigationStackText
//
//  Created by Thomas Cowern on 12/20/22.
//

import Foundation

struct PlatformData {
    var platforms: [Platform] = [.init(name: "XBox", imageName: "xbox-logo", color: .green),
                                 .init(name: "Playstation", imageName: "playstation-logo", color: .indigo),
                                 .init(name: "PC", imageName: "pc-logo", color: .gray),
                                 .init(name: "IPhone", imageName: "iphone-logo", color: .black)]
}
