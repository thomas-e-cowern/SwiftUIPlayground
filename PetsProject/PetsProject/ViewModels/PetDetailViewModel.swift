//
//  PetDetailViewModel.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/24/22.
//

import Foundation

@MainActor
class PetDetailViewModel: ObservableObject {
    private var service: NetworkService
    @Published var components: [UIComponent] = []
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func load(petId: Int) async {
        do {
            let screenModel = try await service.load(Constants.ScreenResources.petDetail(petId: petId))
            self.components = try screenModel.buildComponents()
        } catch {
            print(error)
        }
    }
}
