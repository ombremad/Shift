//
//  Post.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

@Observable
class Post: Identifiable, Message {
    var id = UUID()
    var title: String
    var content: String
    var postedOn: Date
    var user: User
    var numberOfLikes: UInt8
    var likedByUser: Bool
    var isHot: Bool
    var tags: [String]
    var comments: [Comment]
    
    init(title: String, content: String, postedOn: Date, user: User, numberOfLikes: UInt8, likedByUser: Bool, isHot: Bool, tags: [String], comments: [Comment]) {
        self.title = title
        self.content = content
        self.postedOn = postedOn
        self.user = user
        self.numberOfLikes = numberOfLikes
        self.likedByUser = likedByUser
        self.isHot = isHot
        self.tags = tags
        self.comments = comments
    }
    
    convenience init(title: String, content: String, postedOn: Date, user: User, numberOfLikes: UInt8, isHot: Bool, tags: [String]) {
        self.init(title: title, content: content, postedOn: postedOn, user: user, numberOfLikes: numberOfLikes, likedByUser: false, isHot: isHot, tags: tags, comments: [])
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
