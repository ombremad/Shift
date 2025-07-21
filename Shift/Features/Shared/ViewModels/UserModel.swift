//
//  UserModel.swift
//  Shift
//
//  Created by Anne Ferret on 17/07/2025.
//

import SwiftUI

let fieldOfInterests = fieldOfInterestModel()

@Observable
class UserModel {
    private var currentUser: User = User(       // default user for testing purposes
        name: "Julie",
        nickname: "julie_la_codeuse",
        picture: .profile,
        city: "Montreuil",
        interests: [fieldOfInterests.uxui]
    )
    private let sampleUsers: [User] = []    // TODO: insert here a few sample profiles to use in the forum
    
    func getCurrentUser() -> User {
        return currentUser
    }
    
    func setCurrentUser(name: String, nickname: String, picture: ImageResource, city: String, interests: [FieldOfInterest]) {
        currentUser = User(name: name, nickname: nickname, picture: picture, city: city, interests: interests)
    }
    
    func getSampleUsers() -> [User] {
        return sampleUsers
    }
}
