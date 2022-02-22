//
//  EnvPlayView.swift
//  SwiftPlay
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

struct EnvPlayView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 45)
            
            Text("123")
                .font(.system(size: 25))
            
            Spacer().frame(height: 75)
            
            Button {
                print("Pressed")
            } label: {
                Text("Click to Increment")
                    
            }
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .clipShape(Capsule())
            

        }
        .frame(width: 300, height: 300, alignment: .center)
        .padding(20)
    }
}

struct EnvPlayView_Previews: PreviewProvider {
    static var previews: some View {
        EnvPlayView()
    }
}
