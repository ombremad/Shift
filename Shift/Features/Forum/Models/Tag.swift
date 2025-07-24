//
//  Tag.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

@Observable
class Tag: Identifiable {
    var id = UUID()
    var name: String
    var icon: ImageResource
    var isToggled: Bool
    
    init(name: String, icon: ImageResource, isToggled: Bool) {
        self.name = name
        self.icon = icon
        self.isToggled = isToggled
    }
    
    convenience init (name: String, icon: ImageResource) {
        self.init(name: name, icon: icon, isToggled: false)
    }
    
    func toggle() {
        isToggled.toggle()
    }
}
