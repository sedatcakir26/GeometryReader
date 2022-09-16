//
//  ContentView.swift
//  GeometryReader
//
//  Created by Sedat Çakır on 9.09.2022.
//

import SwiftUI


struct ContentView: View {
    
    let astronauts : [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    @State private var showingGrid = true
    
    var body: some View {
        NavigationView{
            Group {
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                    
                }
            } .toolbar{
                Button {
                    showingGrid.toggle()
                } label: {
                    if !showingGrid{
                        Label("Grid",systemImage: "square.grid.2x2")
                    }else{
                        Label("List",systemImage: "list.bullet.rectangle")
                    }
                }
            }
            
            .navigationTitle("Moonshot") .padding([.horizontal, .vertical])
            .background(.darkBackGround)
            .preferredColorScheme(.dark)
            
            
            
            // .navigationTitle("Moonshot")
            
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
