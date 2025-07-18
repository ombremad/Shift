//
//  Post.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var postedOn: Date
    var author: String
    var authorCity: String
    var authorProfilePicture: ImageResource
    var numberOfComments: UInt8
    var numberOfLikes: UInt8
    var isHot: Bool
    var tags: [String]
    
    init(title: String, content: String, postedOn: Date, author: String, authorCity: String, authorProfilePicture: ImageResource, numberOfComments: UInt8, numberOfLikes: UInt8, isHot: Bool, tags: [String]) {
        self.title = title
        self.content = content
        self.postedOn = postedOn
        self.author = author
        self.authorCity = authorCity
        self.authorProfilePicture = authorProfilePicture
        self.numberOfComments = numberOfComments
        self.numberOfLikes = numberOfLikes
        self.isHot = isHot
        self.tags = tags
    }
}
