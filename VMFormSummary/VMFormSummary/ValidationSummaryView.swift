//
//  ValidationSummaryView.swift
//  VMFormSummary
//
//  Created by Thomas Cowern on 10/6/22.
//

import SwiftUI

struct ValidationSummaryView: View {
    
    let errors: [LocalizedError] = []
    
    var body: some View {
        ForEach(errors, id: \.id) { error in
            Text(error.localizedDescription)
        }
    }
}

struct ValidationSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ValidationSummaryView()
    }
}
