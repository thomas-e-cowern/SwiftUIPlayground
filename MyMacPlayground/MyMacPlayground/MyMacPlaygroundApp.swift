//
//  MyMacPlaygroundApp.swift
//  MyMacPlayground
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

@main
struct MyMacPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
//            let settings = Settings()
//            ContentView().environmentObject(settings)
            ContentView().environment(\.layoutDirection, .rightToLeft)
        }
    }
}
