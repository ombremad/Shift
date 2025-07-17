//
//  User.swift
//  Shift
//
//  Created by Anne Ferret on 17/07/2025.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var name: String
    var nickname: String
    var picture: ImageResource
    var city: String
    var interests: [FieldOfInterest]        // this is where we keep track of the user's registered Field of Interest(s)
    
    init(name: String, nickname: String, picture: ImageResource, city: String, interests: [FieldOfInterest]) {
        self.name = name
        self.nickname = nickname
        self.picture = picture
        self.city = city
        self.interests = interests
    }
}
