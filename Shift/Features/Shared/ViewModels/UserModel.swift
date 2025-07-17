//
//  UserModel.swift
//  Shift
//
//  Created by Anne Ferret on 17/07/2025.
//

import SwiftUI

@Observable
class UserModel {
    private var appUser: User = User(       // default user for testing purposes
        name: "Julie",
        nickname: "julie_la_codeuse",
        picture: .profile,
        city: "Montreuil",
        interests: [FieldOfInterest(name: "UX / UI", nameShort: "UX", icon: .bezierCurve)]
    )
    private let sampleUsers: [User] = []    // make a few sample profiles to use in the forum
    
    func getAppUser() -> User {
        return appUser
    }
    
    func setAppUser(name: String, nickname: String, picture: ImageResource, city: String, interests: [FieldOfInterest]) {
        appUser = User(name: name, nickname: nickname, picture: picture, city: city, interests: interests)
    }
    
    func getSampleUsers() -> [User] {
        return sampleUsers
    }
}
