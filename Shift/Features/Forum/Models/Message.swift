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
    var numberOfComments: UInt8 {get set}
    var numberOfLikes: UInt8 {get set}
    var likedByUser: Bool {get set}
    
    func like()
}
