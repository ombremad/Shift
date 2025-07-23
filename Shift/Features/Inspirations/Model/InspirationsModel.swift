//
//  Inspirations.swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import Foundation

struct Inspirations: Identifiable, Codable { // Identifiable -  uses the id property to identify each woman in the List and Codable to decode JSON into this struct.
    
    var id : Int
    let name: String
    let field: String
    let imageWhite: String
    let imageGreen: String
    let birth: String
    let death: String?      // Optional – can be nil if still alive
    let achievement: String
    let biography: String
    let whyInspiring: String
}

extension Inspirations {
    var birthYear: String {
        birth.components(separatedBy: ",").compactMap { $0.trimmingCharacters(in: .whitespaces) }.dropLast().last ?? ""
    }
    // Separates them by a , [ex: "December 10", "1815", "England"], Drops the last item ("England") and keeps the last of what remains ("1815")
    
    var deathYear: String {
        if let death = death {
            return death.components(separatedBy: ",").compactMap { $0.trimmingCharacters(in: .whitespaces) }.dropLast().last ?? ""
        } else {
            return "Present"
        }
    }
    
    var lifeSpan: String {
        "\(birthYear) – \(deathYear)"
    }
}


