//
//  Tag.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

class Tag: Identifiable {
    var id: UUID = UUID()
    var name: String
    var icon: ImageResource
    
    init(name: String, icon: ImageResource) {
        self.name = name
        self.icon = icon
    }
}
