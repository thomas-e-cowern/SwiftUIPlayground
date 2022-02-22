//
//  SwiftPlayApp.swift
//  SwiftPlay
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

@main
struct SwiftPlayApp: App {
    var body: some Scene {
        WindowGroup {
            let settings = Settings()
            ContentView().environmentObject(settings)
        }
    }
}
