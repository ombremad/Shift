//
//  EventsModel.swift
//  Shift
//
//  Created by Mehdi Legoullon on 18/07/2025.
//

import Foundation
import CoreLocation

struct EventModel: Hashable {
    let id = UUID()
    var imageName: String
    var isLiked: Bool
    var title: String
    var date: Date
    var city: String
    var category: String
    var isMyEvent: Bool
    var overview: String?
    var location: String
    var latitude: Double?
    var longitude: Double?
    
    init(imageName: String, isLiked: Bool, title: String, date: Date, city: String, category: String, isMyEvent: Bool, overview: String? = nil, location: String, latitude: Double? = nil, longitude: Double? = nil ) {
        self.imageName = imageName
        self.isLiked = isLiked
        self.title = title
        self.date = date
        self.city = city
        self.category = category
        self.isMyEvent = isMyEvent
        self.overview = overview
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var coordinate: CLLocationCoordinate2D? {
        guard let latitude = latitude, let longitude = longitude else {
            return nil
        }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
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
