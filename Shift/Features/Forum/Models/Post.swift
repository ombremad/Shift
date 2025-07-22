//
//  Post.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

@Observable
class Post: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var postedOn: Date
    var user: User
    var numberOfComments: UInt8
    var numberOfLikes: UInt8
    var likedByUser: Bool
    var isHot: Bool
    var tags: [String]
    
    init(title: String, content: String, postedOn: Date, user: User, numberOfComments: UInt8, numberOfLikes: UInt8, likedByUser: Bool, isHot: Bool, tags: [String]) {
        self.title = title
        self.content = content
        self.postedOn = postedOn
        self.user = user
        self.numberOfComments = numberOfComments
        self.numberOfLikes = numberOfLikes
        self.likedByUser = likedByUser
        self.isHot = isHot
        self.tags = tags
    }
    
    convenience init(title: String, content: String, postedOn: Date, user: User, numberOfComments: UInt8, numberOfLikes: UInt8, isHot: Bool, tags: [String]) {
        self.init(title: title, content: content, postedOn: postedOn, user: user, numberOfComments: numberOfComments, numberOfLikes: numberOfLikes, likedByUser: false, isHot: isHot, tags: tags)
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
