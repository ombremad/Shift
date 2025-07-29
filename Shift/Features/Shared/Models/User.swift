//
//  User.swift
//  Shift
//
//  Created by Anne Ferret on 17/07/2025.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var name: String                // full name ie. what's displayed privately on users' homepage
    var nickname: String            // display name ie. how the user's called on the forum
    var picture: ImageResource
    var city: String
    var interests: [FieldOfInterest]
    
    init(name: String, nickname: String, picture: ImageResource, city: String, interests: [FieldOfInterest]) {
        self.name = name
        self.nickname = nickname
        self.picture = picture
        self.city = city
        self.interests = interests
    }
}
//

