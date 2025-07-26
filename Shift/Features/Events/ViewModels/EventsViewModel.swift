//
//  EventsViewModel.swift
//  Shift
//
//  Created by Mehdi Legoullon on 25/07/2025.
//

import Foundation

@Observable
class EventsViewModel {
    var events: [EventModel] = []
    var filteredEvents: [EventModel] = []
    var selectedIndexOption: Int = 0
    var selectedIndexCategory: [Int] = [0]
    var selectedCity: String = "All"
    
    let categories = ["All", "Web / Mobile", "UX/UI", "Data Science & AI", "DevOps"]
    let options = ["All", "Today", "Tomorrow", "This week", "This month"]
    let cities = ["All", "Paris", "Berlin", "Madrid", "Rome", "Lisbonne", "Bruxelles", "Amsterdam"]
    
    init() {
        loadFakeData()
    }
    
    private func loadFakeData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let date1 = dateFormatter.date(from: "2025-08-01 18:00") ?? Date()
        let date2 = dateFormatter.date(from: "2025-10-05 14:30") ?? Date()
        let date3 = dateFormatter.date(from: "2025-12-10 19:00") ?? Date()
        let date4 = dateFormatter.date(from: "2025-09-15 10:00") ?? Date()
        
        events = [
            EventModel(
                imageName: "Image1",
                isLiked: false,
                title: "The Future of AI: Innovations and Ethical Challenges",
                date: date1,
                city: "Paris",
                category: "Data Science & AI",
                location: ""
            ),
            EventModel(
                imageName: "Image9",
                isLiked: true,
                title: "DevOps: Automation and Continuous Integration for Efficient Software Delivery",
                date: date2,
                city: "Berlin",
                category: "DevOps",
                location: ""
            ),
            EventModel(
                imageName: "Image3",
                isLiked: false,
                title: "Mobile Development: Building High-Performance and Intuitive Applications",
                date: date3,
                city: "Amsterdam",
                category: "Web / Mobile",
                location: ""
            ),
            EventModel(
                imageName: "Image4",
                isLiked: true,
                title: "UX/UI Design: Crafting Memorable User Experiences",
                date: date4,
                city: "Lisbonne",
                category: "UX/UI",
                location: ""
            )
        ]
        filteredEvents = events
    }
    
    func resetToDefaults() {
        selectedIndexOption = 0
        selectedIndexCategory = [0]
        selectedCity = "All"
    }
    
    func filterEvents(byCategories categories: [String]? = nil, byCity city: String? = nil) {
        filteredEvents = events.filter { event in
            let matchesCategory = categories == nil || categories!.contains("All") || categories!.contains(event.category)
            let matchesCity = city == nil || city == "All" || event.city == city
            return matchesCategory && matchesCity
        }
    }
}
