//
//  EventsModel.swift
//  Shift
//
//  Created by Mehdi Legoullon on 18/07/2025.
//

import Foundation

struct EventModel: Hashable {
    let id = UUID()
    var imageName: String
    var isLiked: Bool
    var title: String
    var date: Date
    var city: String
    var category: String
    var location: String //  Pour la map
    
    init(imageName: String, isLiked: Bool, title: String, date: Date, city: String, category: String, location: String) {
        self.imageName = imageName
        self.isLiked = isLiked
        self.title = title
        self.date = date
        self.city = city
        self.category = category
        self.location = location
    }
    

    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    

    func formattedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
