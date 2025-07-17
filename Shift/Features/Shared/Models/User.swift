//
//  User.swift
//  Shift
//
//  Created by Anne Ferret on 17/07/2025.
//

import SwiftUI

struct User {
    var name: String
    var picture: Image
    var city: String
    var interests: [FieldOfInterest]        // this is where we keep track of the user's registered Field of Interest(s)
    
    init(name: String, picture: Image, city: String, interests: [FieldOfInterest]) {
        self.name = name
        self.picture = picture
        self.city = city
        self.interests = interests
    }
}
