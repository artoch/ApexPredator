//
//  ContentView.swift
//  ApexPredator
//
//  Created by Alfredo Tochon on 10/5/23.
//

import SwiftUI

struct ContentView: View {
    
    let apController = ApexController()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(apController.apexPredators) { data in
                    NavigationLink(destination: Text(data.name)) {
                        DinoItem(data: data)
                    }
                }
            }
            .navigationTitle("Apex Predator")
        .background(.black)
        }
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
