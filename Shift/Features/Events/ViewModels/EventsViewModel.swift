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
            EventModel(imageName: "Image1", isLiked: false, title: "AI and Machine Learning Conference", date: today, city: "Paris", category: "Data Science & AI", isMyEvent: false, overview: "Explore the latest trends and innovations in AI and Machine Learning. This conference brings together leading experts and practitioners to share insights and advancements.", location: "Grand Hall"),
            EventModel(imageName: "Image3", isLiked: true, title: "DevOps Summit", date: tomorrow, city: "Berlin", category: "DevOps", isMyEvent: true, overview: "A deep dive into DevOps practices and tools for continuous integration and deployment. Learn from industry leaders about improving your development workflows.", location: "Tech Center"),
            EventModel(imageName: "Image4", isLiked: false, title: "Mobile Development Workshop", date: calendar.date(byAdding: .day, value: 3, to: today)!, city: "Amsterdam", category: "Web / Mobile", isMyEvent: false, overview: "Hands-on workshop covering the latest in mobile app development. Participants will build and deploy mobile applications using modern frameworks.", location: "Innovation Hub"),
            EventModel(imageName: "Image5", isLiked: true, title: "UX Design Masterclass", date: calendar.date(byAdding: .day, value: 5, to: today)!, city: "Lisbonne", category: "UX/UI", isMyEvent: false, overview: "Masterclass on user experience design principles and best practices. This session will cover user research, prototyping, and usability testing.", location: "Creative Space"),
            EventModel(imageName: "Image6", isLiked: false, title: "Cybersecurity Seminar", date: calendar.date(byAdding: .day, value: 2, to: today)!, city: "Madrid", category: "Cybersecurity", isMyEvent: true, overview: "Seminar on the latest threats and protection strategies in cybersecurity. Experts will discuss current trends and future challenges in the field.", location: "Security Forum"),
            EventModel(imageName: "Image7", isLiked: true, title: "Data Science Bootcamp", date: calendar.date(byAdding: .day, value: 4, to: today)!, city: "Rome", category: "Data Science & AI", isMyEvent: false, overview: "Intensive bootcamp on data science techniques and tools. Participants will learn data analysis, machine learning, and data visualization.", location: "Data Lab"),
            EventModel(imageName: "Image8", isLiked: false, title: "Cloud Computing Workshop", date: calendar.date(byAdding: .day, value: 6, to: today)!, city: "Bruxelles", category: "DevOps", isMyEvent: true, overview: "Workshop on cloud computing and its impact on modern IT infrastructure. Topics include cloud services, deployment models, and security considerations.", location: "Cloud Campus"),
            EventModel(imageName: "Image9", isLiked: true, title: "iOS Development Conference", date: calendar.date(byAdding: .day, value: 1, to: tomorrow)!, city: "Paris", category: "Web / Mobile", isMyEvent: false, overview: "Conference on the latest in iOS development and Apple technologies. Sessions will cover new features, tools, and best practices for iOS developers.", location: "Apple Park"),
            EventModel(imageName: "Image10", isLiked: false, title: "UI Animation Workshop", date: calendar.date(byAdding: .day, value: 7, to: today)!, city: "Berlin", category: "UX/UI", isMyEvent: true, overview: "Workshop focused on creating engaging UI animations. Participants will learn techniques to enhance user interfaces with smooth and interactive animations.", location: "Design Studio"),
            EventModel(imageName: "Image11", isLiked: true, title: "Network Security Conference", date: calendar.date(byAdding: .day, value: 8, to: today)!, city: "Amsterdam", category: "Cybersecurity", isMyEvent: false, overview: "Conference on network security and protecting enterprise networks. Topics include threat detection, prevention, and incident response strategies.", location: "Security Center"),
            EventModel(imageName: "Image1", isLiked: false, title: "AI in Healthcare", date: calendar.date(byAdding: .day, value: 9, to: today)!, city: "Lisbonne", category: "Data Science & AI", isMyEvent: true, overview: "Explore the applications of AI in the healthcare industry. This event will cover AI-driven diagnostics, treatment planning, and patient care innovations.", location: "Health Tech"),
            EventModel(imageName: "Image3", isLiked: true, title: "Continuous Integration Seminar", date: calendar.date(byAdding: .day, value: 10, to: today)!, city: "Madrid", category: "DevOps", isMyEvent: false, overview: "Seminar on continuous integration and delivery practices. Learn how to streamline your development pipeline and improve software delivery processes.", location: "Integration Hall"),
            EventModel(imageName: "Image4", isLiked: false, title: "Android Development Bootcamp", date: calendar.date(byAdding: .day, value: 11, to: today)!, city: "Rome", category: "Web / Mobile", isMyEvent: true, overview: "Intensive bootcamp on Android app development. Participants will learn to build and deploy Android applications using the latest tools and technologies.", location: "Android Arena"),
            EventModel(imageName: "Image5", isLiked: true, title: "User Research Workshop", date: calendar.date(byAdding: .day, value: 12, to: today)!, city: "Bruxelles", category: "UX/UI", isMyEvent: false, overview: "Workshop on conducting effective user research. This session will cover methods for gathering user insights and applying them to design decisions.", location: "Research Lab"),
            EventModel(imageName: "Image6", isLiked: false, title: "Blockchain and Security", date: calendar.date(byAdding: .day, value: 13, to: today)!, city: "Paris", category: "Cybersecurity", isMyEvent: true, overview: "Conference on blockchain technology and its security implications. Experts will discuss the potential and challenges of blockchain in various industries.", location: "Blockchain Hub"),
            EventModel(imageName: "Image7", isLiked: true, title: "Big Data Analytics Conference", date: calendar.date(byAdding: .day, value: 14, to: today)!, city: "Berlin", category: "Data Science & AI", isMyEvent: false, overview: "Conference on big data analytics and its business applications. Sessions will cover data-driven decision making, predictive analytics, and data management strategies.", location: "Analytics Center"),
            EventModel(imageName: "Image8", isLiked: false, title: "Serverless Architecture Workshop", date: calendar.date(byAdding: .day, value: 15, to: today)!, city: "Amsterdam", category: "DevOps", isMyEvent: true, overview: "Workshop on building and deploying serverless architectures. Participants will learn about serverless frameworks, best practices, and use cases.", location: "Serverless Space"),
            EventModel(imageName: "Image9", isLiked: true, title: "Cross-Platform Development Seminar", date: calendar.date(byAdding: .day, value: 16, to: today)!, city: "Lisbonne", category: "Web / Mobile", isMyEvent: false, overview: "Seminar on cross-platform development tools and techniques. Learn how to build applications that run seamlessly on multiple platforms.", location: "Cross-Platform Hub"),
            EventModel(imageName: "Image10", isLiked: false, title: "Interaction Design Conference", date: calendar.date(byAdding: .day, value: 17, to: today)!, city: "Madrid", category: "UX/UI", isMyEvent: true, overview: "Conference on interaction design and creating intuitive user interfaces. Topics include user-centered design, usability, and interactive prototyping.", location: "Interaction Lab"),
            EventModel(imageName: "Image11", isLiked: true, title: "Ethical Hacking Workshop", date: calendar.date(byAdding: .day, value: 18, to: today)!, city: "Rome", category: "Cybersecurity", isMyEvent: false, overview: "Workshop on ethical hacking and penetration testing techniques. Participants will learn how to identify and fix security vulnerabilities in systems.", location: "Hacking Arena")
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
