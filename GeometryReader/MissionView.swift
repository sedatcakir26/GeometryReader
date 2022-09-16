//
//  MissionView.swift
//  GeometryReader
//
//  Created by Sedat Çakır on 12.09.2022.
//

import SwiftUI

struct MissionView: View {
    
    let mission : Mission
    let crew : [CrewMember]
    
    var body: some View {
        GeometryReader {geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDate)
                        .fontWeight(.light)
                        
                    
                    VStack(alignment:.leading){
                        
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackGround)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackGround)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                    }
                    .padding(.horizontal)
                    
                    //Silinen kod
                    
                    CrewView(crew: crew)
                
                }
            }
            .padding(.bottom)
            
        }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackGround)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

       static var previews: some View {
           MissionView(mission: missions[2], astronauts: astronauts)
               .preferredColorScheme(.dark)
       }
}
