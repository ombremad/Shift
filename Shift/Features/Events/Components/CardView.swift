//
//  CardView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 25/07/2025.
//

import SwiftUI

struct CardView: View {
    
    let event: EventModel
    @State private var showAlert = false;
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                Color.white
                    .frame(width: 368, height: 285)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.20), radius: 2, x: 0, y: 2)
                
                VStack(spacing: 0) {
                    ZStack(alignment: .topTrailing) {
                        // Image
                        Image(event.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 368, height: 193)
                            .clipped()
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 15,
                                    topTrailingRadius: 15
                                )
                            )
                        
                        // Icons section
                        HStack(spacing: 2) {
                            
                            Button(action: {
                                showAlert = true
                            }) {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.noir)
                                    .padding(10)
                                    .background(Color.neonGreen)
                                    .clipShape(Circle())
                                    .padding([.top, .trailing], 10)
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Succès"),
                                    message: Text("L'événement a été partagé avec succès."),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                            
                            Button(action: {
                                print("Bouton cliqué sur le coeur")
                            }) {
                                Image(systemName: "heart")
                                    .foregroundColor(.noir)
                                    .padding(10)
                                    .background(Color.neonGreen)
                                    .clipShape(Circle())
                                    .padding([.top, .trailing], 10)
                            }
                        }
                        .padding(.top, 135)
                    }
                    .frame(width: 368, height: 193)
                    
                    // Footer card
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(event.title)
                                .font(.custom("Safiro-Bold", size: 16))
                                .foregroundColor(Color.noir)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                            
                            HStack {
                                Text(event.date.formatted(date: .abbreviated, time: .omitted))
                                Text("-")
                                Text(event.city)
                            }
                            .font(.custom("Safiro-regular", size: 14))
                            .foregroundColor(Color.noir)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    // For the preview
    let sampleEvent = EventModel(
        imageName: "Image1",
        isLiked: false,
        title: "Sample Title",
        date: Date(),
        city: "Sample City",
        category: "Web / Mobile",
        location: "Sample Location"
    )
    
    CardView(event: sampleEvent)
}
