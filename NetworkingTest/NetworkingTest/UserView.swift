//
//  UserView.swift
//  NetworkingTest
//
//  Created by Thomas Cowern on 9/8/22.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("**Name**: [Name Here]")
            Text("**Email**: [Email Here]")
            Divider()
            Text("**Company**: [Company Here]")
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
        UserView()
    }
}
