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
    var selectedIndexOption: Int = 0 {
        didSet {
            applyFilters(selectedTab: 0)
        }
    }
    var selectedIndexCategory: [Int] = [0] {
        didSet {
            applyFilters(selectedTab: 0)
        }
    }
    var selectedCity: String = "All" {
        didSet {
            applyFilters(selectedTab: 0)
        }
    }
    var selectedDateOption: Int = 0 {
        didSet {
            applyFilters(selectedTab: 0)
        }
    }
    
    let categories = ["All", "Web / Mobile", "UX/UI", "Data Science & AI", "DevOps"]
    let options = ["All", "Today", "Tomorrow", "This week", "This month"]
    let cities = ["All", "Paris", "Berlin", "Madrid", "Rome", "Lisbonne", "Bruxelles", "Amsterdam"]
    let tabs = ["Filtered Events", "My Events", "Favorites"]
    
    private var today: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    private var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: today)!
    }
    
    private var endOfWeek: Date {
        Calendar.current.date(byAdding: .day, value: 7, to: today)!
    }
    
    private var endOfMonth: Date {
        Calendar.current.date(byAdding: .month, value: 1, to: today)!
    }
    
    init() {
        loadFakeData()
    }
    
    private func loadFakeData() {
        
        let calendar = Calendar.current
        
        // Create fake events
        events = [
            EventModel(imageName: "Image1", isLiked: false, title: "AI and Machine Learning Conference", date: today, city: "Paris", category: "Data Science & AI", isMyEvent: false, location: "Grand Hall"),
            EventModel(imageName: "Image3", isLiked: true, title: "DevOps Summit", date: tomorrow, city: "Berlin", category: "DevOps", isMyEvent: true, location: "Tech Center"),
            EventModel(imageName: "Image4", isLiked: false, title: "Mobile Development Workshop", date: calendar.date(byAdding: .day, value: 3, to: today)!, city: "Amsterdam", category: "Web / Mobile", isMyEvent: false, location: "Innovation Hub"),
            EventModel(imageName: "Image5", isLiked: true, title: "UX Design Masterclass", date: calendar.date(byAdding: .day, value: 5, to: today)!, city: "Lisbonne", category: "UX/UI", isMyEvent: false, location: "Creative Space"),
            EventModel(imageName: "Image6", isLiked: false, title: "Cybersecurity Seminar", date: calendar.date(byAdding: .day, value: 2, to: today)!, city: "Madrid", category: "Cybersecurity", isMyEvent: true, location: "Security Forum"),
            EventModel(imageName: "Image7", isLiked: true, title: "Data Science Bootcamp", date: calendar.date(byAdding: .day, value: 4, to: today)!, city: "Rome", category: "Data Science & AI", isMyEvent: false, location: "Data Lab"),
            EventModel(imageName: "Image8", isLiked: false, title: "Cloud Computing Workshop", date: calendar.date(byAdding: .day, value: 6, to: today)!, city: "Bruxelles", category: "DevOps", isMyEvent: true, location: "Cloud Campus"),
            EventModel(imageName: "Image9", isLiked: true, title: "iOS Development Conference", date: calendar.date(byAdding: .day, value: 1, to: tomorrow)!, city: "Paris", category: "Web / Mobile", isMyEvent: false, location: "Apple Park"),
            EventModel(imageName: "Image10", isLiked: false, title: "UI Animation Workshop", date: calendar.date(byAdding: .day, value: 7, to: today)!, city: "Berlin", category: "UX/UI", isMyEvent: true, location: "Design Studio"),
            EventModel(imageName: "Image11", isLiked: true, title: "Network Security Conference", date: calendar.date(byAdding: .day, value: 8, to: today)!, city: "Amsterdam", category: "Cybersecurity", isMyEvent: false, location: "Security Center"),
            EventModel(imageName: "Image1", isLiked: false, title: "AI in Healthcare", date: calendar.date(byAdding: .day, value: 9, to: today)!, city: "Lisbonne", category: "Data Science & AI", isMyEvent: true, location: "Health Tech"),
            EventModel(imageName: "Image3", isLiked: true, title: "Continuous Integration Seminar", date: calendar.date(byAdding: .day, value: 10, to: today)!, city: "Madrid", category: "DevOps", isMyEvent: false, location: "Integration Hall"),
            EventModel(imageName: "Image4", isLiked: false, title: "Android Development Bootcamp", date: calendar.date(byAdding: .day, value: 11, to: today)!, city: "Rome", category: "Web / Mobile", isMyEvent: true, location: "Android Arena"),
            EventModel(imageName: "Image5", isLiked: true, title: "User Research Workshop", date: calendar.date(byAdding: .day, value: 12, to: today)!, city: "Bruxelles", category: "UX/UI", isMyEvent: false, location: "Research Lab"),
            EventModel(imageName: "Image6", isLiked: false, title: "Blockchain and Security", date: calendar.date(byAdding: .day, value: 13, to: today)!, city: "Paris", category: "Cybersecurity", isMyEvent: true, location: "Blockchain Hub"),
            EventModel(imageName: "Image7", isLiked: true, title: "Big Data Analytics Conference", date: calendar.date(byAdding: .day, value: 14, to: today)!, city: "Berlin", category: "Data Science & AI", isMyEvent: false, location: "Analytics Center"),
            EventModel(imageName: "Image8", isLiked: false, title: "Serverless Architecture Workshop", date: calendar.date(byAdding: .day, value: 15, to: today)!, city: "Amsterdam", category: "DevOps", isMyEvent: true, location: "Serverless Space"),
            EventModel(imageName: "Image9", isLiked: true, title: "Cross-Platform Development Seminar", date: calendar.date(byAdding: .day, value: 16, to: today)!, city: "Lisbonne", category: "Web / Mobile", isMyEvent: false, location: "Cross-Platform Hub"),
            EventModel(imageName: "Image10", isLiked: false, title: "Interaction Design Conference", date: calendar.date(byAdding: .day, value: 17, to: today)!, city: "Madrid", category: "UX/UI", isMyEvent: true, location: "Interaction Lab"),
            EventModel(imageName: "Image11", isLiked: true, title: "Ethical Hacking Workshop", date: calendar.date(byAdding: .day, value: 18, to: today)!, city: "Rome", category: "Cybersecurity", isMyEvent: false, location: "Hacking Arena")
        ]
        filteredEvents = events
    }
    
    func resetToDefaults() {
        selectedIndexOption = 0
        selectedIndexCategory = [0]
        selectedCity = "All"
        selectedDateOption = 0
    }
    
    private func applyFilters(categories: [String]?, city: String?, dateOption: Int?, isMyEvent: Bool? = nil, isLiked: Bool? = nil) {
        let calendar = Calendar.current
        
        filteredEvents = events.filter { event in
            let matchesCategory = categories == nil || categories!.contains("All") || categories!.contains(event.category)
            let matchesCity = city == nil || city == "All" || event.city == city
            
            let matchesDate: Bool
            switch dateOption {
            case 1:
                matchesDate = calendar.isDate(event.date, inSameDayAs: today)
            case 2:
                matchesDate = calendar.isDate(event.date, inSameDayAs: tomorrow)
            case 3:
                matchesDate = event.date >= today && event.date <= endOfWeek
            case 4:
                matchesDate = event.date >= today && event.date <= endOfMonth
            default:
                matchesDate = true
            }
            
            let matchesMyEvent = isMyEvent == nil || event.isMyEvent == isMyEvent
            let matchesLiked = isLiked == nil || event.isLiked == isLiked
            
            return matchesCategory && matchesCity && matchesDate && matchesMyEvent && matchesLiked
        }
    }
    
    func applyFilters(selectedTab: Int) {
        let selectedCategories = selectedIndexCategory.isEmpty ? nil : selectedIndexCategory.map { categories[$0] }
        let selectedCity = selectedCity == "All" ? nil : selectedCity
        let selectedDateOption = selectedDateOption
        
        switch selectedTab {
        case 0: // Filtered events
            applyFilters(categories: selectedCategories, city: selectedCity, dateOption: selectedDateOption)
        case 1: // My events
            applyFilters(categories: selectedCategories, city: selectedCity, dateOption: selectedDateOption, isMyEvent: true)
        case 2: // Favourites
            applyFilters(categories: selectedCategories, city: selectedCity, dateOption: selectedDateOption, isLiked: true)
        default:
            break
        }
    }
}
