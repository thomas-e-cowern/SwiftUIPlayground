//
//  ContentView.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = PetListViewModel(service: LocalService())
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.components, id: \.uniqueId) { component in
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