//
//  Comment.swift
//  Shift
//
//  Created by Anne Ferret on 23/07/2025.
//

import SwiftUI

@Observable
class Comment: Identifiable, Message {
    var id = UUID()
    var content: String
    var postedOn: Date
    var user: User
    var numberOfComments: UInt8
    var numberOfLikes: UInt8
    var likedByUser: Bool
    var nestedLevel: UInt8
    var comments: [Comment]
    
    init(content: String, postedOn: Date, user: User, numberOfComments: UInt8, numberOfLikes: UInt8, likedByUser: Bool, nestedLevel: UInt8, comments: [Comment]) {
        self.content = content
        self.postedOn = postedOn
        self.user = user
        self.numberOfComments = numberOfComments
        self.numberOfLikes = numberOfLikes
        self.likedByUser = likedByUser
        self.nestedLevel = nestedLevel
        self.comments = comments
    }
    
    convenience init(content: String, postedOn: Date, user: User, numberOfComments: UInt8, numberOfLikes: UInt8, nestedLevel: UInt8) {
        self.init(content: content, postedOn: postedOn, user: user, numberOfComments: numberOfComments, numberOfLikes: numberOfLikes, likedByUser: false, nestedLevel: nestedLevel, comments: [])
    }
    
    func like() {
        if likedByUser {
            numberOfLikes -= 1
        } else {
            numberOfLikes += 1
        }
        likedByUser.toggle()
    }
}
