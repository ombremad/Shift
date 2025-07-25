//
//  EventsViewModel.swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import Foundation

class EventsViewModel {
    @Published var events: [EventModel] = [];

    init() {
        loadFakeData();
    }
    
    private func loadFakeData() {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm";
        
        let date1 = dateFormatter.date(from: "2025-08-01 18:00") ?? Date();
        let date2 = dateFormatter.date(from: "2025-10-05 14:30") ?? Date();
        let date3 = dateFormatter.date(from: "2025-12-10 19:00") ?? Date();
        
        events = [
            EventModel(
                imageName: "Image1",
                isLiked: false,
                title: "Conférence sur l'Intelligence Artificielle et l'Éthique",
                date: date1,
                city: "Paris",
                location: ""
            ),
            EventModel(
                imageName: "Image9",
                isLiked: true,
                title: "Symposium sur le Cloud Computing et la Sécurité",
                date: date2,
                city: "Berlin",
                location: ""
            ),
            EventModel(
                imageName: "Image3",
                isLiked: false,
                title: "Atelier sur le Développement d'Applications Mobile",
                date: date3,
                city: "Amsterdam",
                location: ""
            )
        ]
    }
    
    func toggleLike(for event: EventModel) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index].isLiked.toggle()
        }
    }
}
