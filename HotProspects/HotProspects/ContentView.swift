//
//  ContentView.swift
//  HotProspects
//
//  Created by Thomas Cowern New on 3/23/22.
//

import SwiftUI
import UserNotifications
import SamplePackage

struct ContentView: View {
    
    let possibleNumbers = Array(1...60)
    
    var body: some View {
        
        Text(results)
            .padding()
        
        
//        VStack {
//            Button("Request permission") {
//                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                    if success {
//                        print("All Set")
//                    } else if let error = error {
//                        print("Error: \(error.localizedDescription)")
//                    }
//                }
//            }
//
//            Button("Schedule notification") {
//                let content = UNMutableNotificationContent()
//                content.title = "Feed the cat"
//                content.subtitle = "He looks hungry"
//                content.sound = UNNotificationSound.default
//
//                // show it 5 seconds from now
//                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
//
//                // choose a random identifier
//                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//                // add the notification request
//                UNUserNotificationCenter.current().add(request)
//            }
//        }
    }
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
