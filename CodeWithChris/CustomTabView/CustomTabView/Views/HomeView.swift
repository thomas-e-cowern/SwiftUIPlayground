//
//  HomeView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var isSubscribed: Bool = false
    @State var selectedOption: String = ""
    
    var options: [String] = ["Daily", "Weekly", "Monthly", "Quarterly"]
    
    var body: some View {
        HStack (alignment: .center) {
            Form {
                Text("Home View")
                TextField("Name", text: $name)
                TextField("Email", text: $email)
                
                Section {
                    Toggle(isOn: $isSubscribed) {
                        Text("Subscribe?")
                    }
                    
                    if isSubscribed {
                        Picker("Select and option", selection: $selectedOption) {
                            ForEach(options, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .pickerStyle(.wheel)
                    } else {
                        /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                    }
                }
          
                
                
                HStack {
                    Spacer()
                    Button("Save") {
                        
                    }
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
