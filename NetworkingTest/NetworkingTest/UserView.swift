//
//  UserView.swift
//  NetworkingTest
//
//  Created by Thomas Cowern on 9/8/22.
//

import SwiftUI

struct UserView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("**Name**: \(user.name)")
            Text("**Email**: \(user.email)")
            Divider()
            Text("**Company**: \(user.company.name)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal, 4)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: .init(id: 0, name: "Bill SMith", email: "Bill@bill.com", company: .init(name: "BillVille", catchPhrase: "We have no idea")))
    }
}
