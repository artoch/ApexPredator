//
//  ApexController.swift
//  ApexPredator
//
//  Created by Alfredo Tochon on 10/5/23.
//

import Foundation

class ApexController {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("error decoding json data: \(error)")
            }
        }
    }
    
    
}
