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
                    VStack(alignment: .leading, spacing: 10) {
                        Text(event.title)
                            .font(.title)
                            .font(.custom("Safiro-semiBold", size: 22))
                            .foregroundColor(Color.noir)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)

                        
                        HStack {
                            Text(event.date.formatted(date: .abbreviated, time: .omitted))
                            Text(event.city)
                        }
                        .font(.custom("Safiro-semiBold", size: 16))
                        .foregroundColor(Color.noir)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    
                    HStack {
                        Text("Participants")
                            .font(.custom("Safiro-semiBold", size: 16))
                            .foregroundColor(Color.noir)
                            .padding(.top, 25)
                            .padding(.leading)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Overview")
                            .font(.custom("Safiro-semiBold", size: 16))
                            .foregroundColor(Color.noir)
                            .padding(.leading)
                        
                        Text(event.overview ?? "No overview available")
                            .font(.custom("Safiro-Regular", size: 14))
                            .foregroundColor(Color.noir)
                            .padding(.leading)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.top, 25)



                    
                    
                    
                    
                    Divider()
                        .padding(.horizontal)
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
            .background(Color.background)
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
            overview: "Explore the latest trends and innovations in AI and Machine Learning. This conference brings together leading experts and practitioners to share insights and advancements.",
            location: "Grand Palais"
        )
        
        NavigationView {
            EventDetailView(event: sampleEvent)
        }
    }
}
