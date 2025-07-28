//
//  EventDetailView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 24/07/2025.
//

import SwiftUI

struct EventDetailView: View {
    let event: EventModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image(event.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 402, height: 276)
                    .clipped()
                
                // Main content
                VStack(alignment: .leading, spacing: 15) {
                    Text(event.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top, 20)
                }
                .frame(maxWidth: .infinity)
                .background(Color.background)
                .clipShape(
                    .rect(
                        topLeadingRadius: 15,
                        topTrailingRadius: 15
                    )
                )
                .padding(.top, -32)
            }
        }
        .background(Color.background)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}


struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleEvent = EventModel(
            imageName: "event-1",
            isLiked: true,
            title: "Conférence SwiftUI",
            date: Date(),
            city: "Paris",
            category: "Technologie",
            isMyEvent: true,
            location: "Grand Palais"
        )
        
        NavigationView {
            EventDetailView(event: sampleEvent)
        }
    }
}
