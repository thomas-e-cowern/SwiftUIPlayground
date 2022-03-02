//
//  CreditsView.swift
//  TabSplit
//
//  Created by Thomas Cowern New on 3/2/22.
//

import SwiftUI

struct CreditsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Text("This is the credits view...")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Back") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
