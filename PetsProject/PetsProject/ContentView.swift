//
//  ContentView.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = PetListViewModel(service: WebService())
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.components, id: \.id) { component in
                    component.render()
                }
                .navigationTitle("Pets")
            }.task {
                await vm.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
