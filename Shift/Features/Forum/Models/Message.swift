//
//  Message.swift
//  Shift
//
//  Created by Anne Ferret on 23/07/2025.
//

import SwiftUI

protocol Message {
    var content: String {get set}
    var postedOn: Date {get set}
    var user: User {get set}
    var numberOfLikes: UInt8 {get set}
    var likedByUser: Bool {get set}
    var comments: [Comment] {get set}
    
    func like()
}
