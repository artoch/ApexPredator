//
//  ContentView.swift
//  ApexPredator
//
//  Created by Alfredo Tochon on 10/5/23.
//

import SwiftUI

struct ContentView: View {
    
    let apController = ApexController()
    
    @State var sortAlphabetical = false
    @State var currentFilter = "All"
    
    var body: some View {
        
        apController.filterBy(type: currentFilter)
        
        sortAlphabetical ? apController.sortByAplabetical() : apController.sortByMoviesAppearance()
        
        return NavigationView {
            List {
                ForEach(apController.apexPredators) { data in
                    NavigationLink(destination: PredatorDetail(data: data)) {
                        DinoItem(data: data)
                    }
                }
            }
            .navigationTitle("Apex Predator")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            sortAlphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: sortAlphabetical ? "film" : "textformat")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(apController.typeFilters, id: \.self) { type in
                                HStack {
                                    Text(type)
                                    Spacer()
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
