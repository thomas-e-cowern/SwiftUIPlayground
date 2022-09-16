//
//  PetListViewModel.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation

@MainActor
class PetListViewModel: ObservableObject {
    
    private var service: NetworkService
    @Published var components: [UIComponent] = []
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func load() async {
        
        do {
            print("In Do")
            let screenModel = try await service.load(Constants.ScreenResources.petListing)
            print("Beyond screenModel")
            components = try screenModel.buildComponents()
            print("Beyond components")
        } catch {
            print("Error in load: \(error.localizedDescription)")
        }
    }
}
