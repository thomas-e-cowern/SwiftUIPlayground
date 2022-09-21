//
//  Navigator.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/21/22.
//

import Foundation
import SwiftUI

struct SheetView<V: View>: View {
    @State private var isPresented: Bool = false
    let content: () -> V
    let destinationView: AnyView
    
    var body: some View {
        content().onTapGesture {
            isPresented = true
        }.sheet(isPresented: $isPresented) {
            destinationView
        }
    }
}

class Navigator {
    
    static func perform<V: View>(action: Action, payload: Any? = nil, content: @escaping () -> V) -> AnyView {
        
        var desinationView: AnyView!
        
        switch action.destination {
            case .petDetail:
            if let payload = payload as? URL {
                desinationView = Text(payload.absoluteString).toAnyView()
            } else {
                desinationView = EmptyView().toAnyView()
            }
//                desinationView = Text("Pet Detail").toAnyView()
        }
        
        switch action.type {
            case .sheet:
            return SheetView(content: {
                content()
            }, destinationView: desinationView).toAnyView()
        }
    }
}
