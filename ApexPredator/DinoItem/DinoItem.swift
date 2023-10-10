//
//  DinoItem.swift
//  ApexPredator
//
//  Created by Alfredo Tochon on 10/5/23.
//

import SwiftUI

struct DinoItem: View {
    
    let data: ApexPredator
    
    var body: some View {
        HStack {
                Image(data.name.lowerNoSpace)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80 ,height: 80)
                    .shadow(color: .white, radius: 1, x: 0, y: 0)
                
            VStack(alignment: .leading)  {
       
                    Text(data.name)
                        .bold()
                        .font(.title3)

                Text(data.type.capitalized)
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.vertical , 6)
                        .padding(.horizontal, 13)
                        .background(data.typeOverlay().opacity(0.33))
                        .clipShape(.rect(cornerRadius: 20.0))
          
                    
                }
        }
    }
}

struct DinoItem_Previews: PreviewProvider {
    static var previews: some View {
        let movieScene = [MovieScene(id: 1, movie: "test", sceneDescription: "description")]
        
        let apexPredator = ApexPredator(id: 1, name: "Brachiosaurus", type: "land", movies: [], movieScenes: movieScene, link: "test.com")
        
        DinoItem(data: apexPredator)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
