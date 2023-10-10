//
//  PredatorDetail.swift
//  ApexPredator
//
//  Created by Alfredo Tochon on 10/9/23.
//

import SwiftUI

struct PredatorDetail: View {
    
    let data: ApexPredator
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing) {
                Image(data.type)
                    .resizable()
                    .scaledToFit()
                
                Image(data.name.lowerNoSpace)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/4)
                    .shadow(color: .black, radius: 6, x: 0, y: 0)
                    .offset(y: -210)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
         
                HStack {
                    VStack(alignment: .leading) {
                        Text(data.name)
                            .bold()
                            .font(.largeTitle)
                            .padding(.bottom, 8)
                        
                        Text("Appear in:")
                            .font(.title3)
                        
                        ForEach(data.movies, id: \.self) { info in
                            Text("- " + info)
                        }
                        
                        Text("Movie Momments")
                            .bold()
                            .font(.largeTitle)
                            .padding(.vertical)
                        
                        ForEach(data.movieScenes) {
                            Text($0.movie)
                                .font(.title3)
                            Text($0.sceneDescription)
                        }
                        
                        Text("Read more:")
                            .font(.caption)
                            .padding(.top)
                        Link(destination: URL(string: data.link)!) {
                            Text(data.link)
                                .font(.caption)
                                .foregroundStyle(.blue)
                        }
                        
                        
                    }
                    
                    Spacer()
                }
                .padding(.top, -230)
                .padding()
                    
           
                
            }
        }.ignoresSafeArea()
    }
}

struct PredatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        let movieScene = [MovieScene(id: 1, movie: "test", sceneDescription: "description")]
        
        let movies = ["shurackzir park", "camaleon asesio"]
        
        let apexPredator = ApexPredator(id: 1, name: "Brachiosaurus", type: "land", movies: movies, movieScenes: movieScene, link: "test.com")
        
        PredatorDetail(data: apexPredator)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
