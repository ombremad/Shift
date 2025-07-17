//
//  FieldOfInterest.swift
//  Shift
//
//  Created by Anne Ferret on 17/07/2025.
//

import SwiftUI

struct FieldOfInterest {
    var name: String            // full name ie. "Cyber Security"
    var nameShort: String       // short name for some pages ie. "Cyber"
    var icon: ImageResource
    
    init(name: String, nameShort: String, icon: ImageResource) {
        self.name = name
        self.nameShort = nameShort
        self.icon = icon
    }
}
