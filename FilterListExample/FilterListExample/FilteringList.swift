//
//  FilteringList.swift
//  FilterListExample
//
//  Created by Thomas Cowern on 12/8/22.
//

import SwiftUI

struct FilteringList<T: Identifiable, Content: View>: View {
    
    @State private var filteredItems = [T]()
    @State private var filterString = ""
    
    var body: some View {
        VStack {
            TextField("Type to filter", text: $filterString.onChange(applyFilter))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            List(filteredItems) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.address)
                        .foregroundColor(.secondary)
                }
            }
            .onAppear(perform: applyFilter)

        }
    }
    
    func applyFilter() {
        let cleanedFilter = filterString.trimmingCharacters(in: .whitespacesAndNewlines)

        if cleanedFilter.isEmpty {
            filteredItems = users
        } else {
            filteredItems = users.filter { $0.name
                    .localizedCaseInsensitiveContains(cleanedFilter) }
        }
    }
}

//struct FilteringList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteringList()
//    }
//}
