//
//  String + Extension.swift
//  ApexPredator
//
//  Created by Alfredo Tochon on 10/5/23.
//

import Foundation

extension String {
    var lowerNoSpace: String {
        self.lowercased().filter { $0 != " " }
    }
}
