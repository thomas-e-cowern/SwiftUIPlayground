//
//  PetListViewModel.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation

class PetListViewModel: ObservableObject {
    
    private var service: WebService
    
    init(service: WebService) {
        self.service = service
    }
    
    func load() async {
        
        do {
            let screenModel = try  await service.load(resource: Constants.Urls.petListing)
        } catch {
            print(error.localizedDescription)
        }
    }
}
