//
//  PetDetailScreen.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/24/22.
//

import SwiftUI

struct PetDetailScreen: View {
    
    let petId: Int
    
    var body: some View {
        Text("Pet Details Screen")
    }
}

struct PetDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailScreen(petId: 1)
    }
}
