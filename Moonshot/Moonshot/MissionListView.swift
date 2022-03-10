//
//  MissionListView.swift
//  Moonshot
//
//  Created by Thomas Cowern New on 3/10/22.
//

import SwiftUI

struct MissionListView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding(.leading, 60)
                                
                                Spacer()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.trailing, 60)
                            }
                            .frame(width: .infinity)
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
            .frame(maxWidth: .infinity)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct MissionListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView()
    }
}
