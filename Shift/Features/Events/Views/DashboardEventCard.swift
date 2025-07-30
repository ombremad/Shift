//
//  DashboardEventCard.swift
//  Shift
//
//  Created by Mehdi Legoullon on 29/07/2025.
//

import SwiftUI

struct DashboardEventCard: View {
    
    let event: EventModel
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blanc)
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 0.5)
            VStack (alignment: .leading, spacing: 5){
                Image(event.imageName)
                    .resizable()
                    .clipped()
                    .frame(width: 149, height: 118)
                    .cornerRadius(10)
                Text(event.title)
                    .foregroundColor(.noir)
                    .font(.custom("Safiro-SemiBold", size: 14))
                HStack {
                    Text(event.date.formatted(date: .abbreviated, time: .omitted))
                    Text("•")
                    Text(event.city)
                }
                .foregroundColor(.noir)
                .font(.custom("HelveticaNeue-Courant", size: 14))
            }
            .padding(15)
        }
        .frame(width: 169, height: 195)
    }
}

#Preview {
    let sampleEvent = EventModel(
        imageName: "event-1",
        isLiked: false,
        title: "HelloWomen Hackton",
        date: Date(),
        city: "City",
        category: "Web / Mobile",
        isMyEvent: true,
        location: "Sample Location"
    )
    DashboardEventCard(event: sampleEvent)
}
