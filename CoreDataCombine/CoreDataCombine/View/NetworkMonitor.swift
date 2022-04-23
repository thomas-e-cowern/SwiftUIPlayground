//
//  NetworkMonitor.swift
//  CoreDataCombine
//
//  Created by Thomas Cowern New on 4/23/22.
//

import SwiftUI
import Network

final class NetworkMonitor: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    @Published var isConnected = true
    
    init () {
        monitor.pathUpdateHandler = {[weak self] path in
            DispatchQueue.main.async {
                withAnimation() {
                    self?.isConnected = path.status == .satisfied ? true : false
                }
            }
            
        }
        monitor.start(queue: queue)
    }
}
