//
//  ListLayout.swift
//  GeometryReader
//
//  Created by Sedat Çakır on 16.09.2022.
//

import SwiftUI

struct ListLayout: View {
    
    let missions : [Mission]
    let astronauts : [String : Astronaut]
    
    var body: some View {
       
            List{
                ForEach(missions){mission in
                    NavigationLink{
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack{
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .padding()
                            VStack{
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth:.infinity)
                            .background(.lightBackGround)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackGround))
                        
                    }
                }
               
                .listRowBackground(Color.darkBackGround)
                .frame( maxWidth: .infinity, maxHeight: .infinity)
                
            }
            
            .listStyle(PlainListStyle())
            
    }
    
    
}

//struct ListLayout_Previews: PreviewProvider {
//  static var previews: some View {
//      ListLayout()
//   }
//}
