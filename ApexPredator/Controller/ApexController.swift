//
//  ApexController.swift
//  ApexPredator
//
//  Created by Alfredo Tochon on 10/5/23.
//

import Foundation

class ApexController {
    var apexPredators: [ApexPredator] = []
    private var allApexPredators: [ApexPredator] = []
    let typeFilters = ["All", "Land", "Air", "Sea"]
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("error decoding json data: \(error)")
            }
        }
    }
    
    func typeIcon(for type: String ) -> String {
        switch type {
        case "Land": return "leaf.fill"
        case "Air": return "wind"
        case "Sea": return "drop.fill"
        default:  return "square.stack.3d.up.fill"
        }
    }
    
    func filterBy(type: String) {
        switch type {
        case "Land", "Air", "Sea":
            apexPredators = allApexPredators.filter {
                $0.type == type.lowercased()
            }
        default:
            apexPredators = allApexPredators
        }
    }
    
    func sortByAplabetical() {
        apexPredators.sort(by: { $0.name < $1.name } )
    }
    
    func sortByMoviesAppearance() {
        apexPredators.sort(by: {$0.id < $1.id} )
    }
    
}
