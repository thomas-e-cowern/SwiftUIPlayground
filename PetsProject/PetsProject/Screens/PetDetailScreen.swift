//
//  PetDetailScreen.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/24/22.
//

import SwiftUI

struct PetDetailScreen: View {
    
    let petId: Int
    
    @StateObject private var vm: PetDetailViewModel
    
    init(petId: Int) {
        print("Inside pet detail screen init")
        _vm = StateObject(wrappedValue: PetDetailViewModel(service: WebService()))
        self.petId = petId
        print("Pet ID from Pet detail screen: \(self.petId)")
    }
    
    var body: some View {
        ScrollView {
            ForEach(vm.components, id: \.id) { component in
                component.render()
            }
            .task {
                await vm.load(petId: petId)
            }
        }
    }
}

struct PetDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailScreen(petId: 1)
    }
}
