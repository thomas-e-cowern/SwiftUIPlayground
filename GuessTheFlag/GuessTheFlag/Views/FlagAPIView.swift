//
//  FlagAPIView.swift
//  GuessTheFlag
//
//  Created by Thomas Cowern New on 3/4/22.
//

import SwiftUI

struct FlagAPIView: View {
    
    @State private var countries = countryCodes
    
    var body: some View {
        VStack {
            Text("Look Below")
        }
//        .onAppear {
//            getCountryData()
//        }
    }
    
    
//    func getCountryData () {
//        Network().getCountries { (result) in
//            switch result {
//            case .success(let countries):
//                DispatchQueue.main.async {
//                    self.countries = countries
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}

struct FlagAPIView_Previews: PreviewProvider {
    static var previews: some View {
        FlagAPIView()
    }
}
