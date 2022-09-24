//
//  Constants.swift
//  PetsProject
//
//  Created by Thomas Cowern on 9/12/22.
//

import Foundation

struct Constants {
    
    struct ScreenResources {
        
        static let petListing = "pet-listing"
        static let baseURL = URLComponents(string: "http://localhost:3000")!
        
        static func petDetail(petId: Int) -> String {
            return "pet-detail/\(petId)"
        }

        static func resource(for resourceName: String) -> URL? {
            var components = baseURL
            components.path = "/\(resourceName)"
            return components.url
        }
    }
    
    struct Urls {
        static let baseUrl = "http://localhost:3000"
        static let petListing = "\(baseUrl)/pet-listing"
    }
    
}
