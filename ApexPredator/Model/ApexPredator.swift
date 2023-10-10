//
//  ApexPredator.swift
//  ApexPredator
//
//  Created by Alfredo Tochon on 10/5/23.
//

import SwiftUI


struct ApexPredator: Codable , Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    func typeOverlay() -> Color {
        switch type {
        case "land":
            return Color.brown
        case "air":
            return .teal
        case "sea":
            return .blue
        default:
            return Color.brown
        }
    }
}

struct MovieScene: Codable , Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
