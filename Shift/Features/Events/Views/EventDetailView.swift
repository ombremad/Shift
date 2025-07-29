//
//  EventDetailView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 24/07/2025.
//

import SwiftUI

struct EventDetailView: View {
    let event: EventModel
    var viewModel: EventsViewModel

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
                        HStack {
                            Text(event.title)
                                .font(.title)
                                .font(.custom("Safiro-semiBold", size: 22))
                                .foregroundColor(Color.noir)
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)

                            Spacer()

                            HStack(spacing: 5) {
                                ZStack {
                                    Circle()
                                        .frame(width: 35)
                                        .foregroundColor(.neonGreen)
                                    Image("share")
                                        .resizable()
                                        .frame(width: 13, height: 15)
                                }

                                ZStack {
                                    Circle()
                                        .frame(width: 35)
                                        .foregroundColor(.neonGreen)
                                    Image(
                                        systemName: event.isLiked
                                            ? "heart.fill" : "heart"
                                    )
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(.black)
                                }
                            }
                        }

                        HStack {
                            Text(
                                event.date.formatted(
                                    date: .abbreviated,
                                    time: .omitted
                                )
                            )
                            Text(event.city)
                        }
                        .font(.custom("Safiro-semiBold", size: 16))
                        .foregroundColor(Color.noir)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Participants")
                            .font(.custom("Safiro-semiBold", size: 16))
                            .foregroundColor(Color.noir)
                            .padding(.leading)
                            .padding(.top, 25)

                        HStack(spacing: 2) {
                            ZStack {
                                Circle()
                                    .frame(width: 36, height: 36)
                                    .foregroundColor(.gray)
                                Image("anita")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .clipShape(Circle())
                            }

                            ZStack {
                                Circle()
                                    .frame(width: 36, height: 36)
                                    .foregroundColor(.gray)
                                Image("sarah")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .clipShape(Circle())
                            }

                            ZStack {
                                Circle()
                                    .frame(width: 36, height: 36)
                                    .foregroundColor(.gray)
                                Image("viviane")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .clipShape(Circle())
                            }

                            ZStack {
                                Circle()
                                    .frame(width: 36, height: 36)
                                    .foregroundColor(.violet)
                                Text("\(event.participantCount ?? 0)")
                                    .font(.custom("Safiro-Regular", size: 12))
                                    .foregroundColor(.white)
                            }
                        }
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

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Location")
                            .font(.custom("Safiro-semiBold", size: 16))
                            .foregroundColor(Color.noir)
                            .padding(.leading)

                        HStack(spacing: 10) {
                            Image(systemName: "mappin.and.ellipse")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.noir)
                            Text("\(event.location), \(event.city)")
                                .font(.custom("Safiro-Regular", size: 14))
                                .foregroundColor(Color.noir)
                        }
                        .padding(.leading)
                        .padding(.top, 10)

                        VStack {
                            HStack {
                                Spacer()

                                if let coordinate = event.coordinate {
                                    MapView(coordinate: coordinate)
                                        .padding(.top, 10)
                                } else {
                                    Text("No location data available")
                                        .padding(.top, 10)
                                }

                                Spacer()
                            }

                            Button(action: {
                                print(
                                    "Participate button pressed for event with ID: \(event.id)"
                                )
                                viewModel.toggleParticipation(for: event.id)

                            }) {
                                Text("Participate")
                                    .frame(width: 167, height: 40)
                                    .font(.custom("Safiro-SemiBold", size: 16))
                                    .background(.violet)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.top, 20)

                        }
                        .padding(.bottom, 20)

                    }

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
        NavigationView {
            let viewModel = EventsViewModel()

            let sampleEvent = EventModel(
                imageName: "event-1",
                isLiked: true,
                title: "Conférence SwiftUI",
                date: Date(),
                city: "Paris",
                category: "Technologie",
                isMyEvent: true,
                overview:
                    "Explore the latest trends and innovations in AI and Machine Learning. This conference brings together leading experts and practitioners to share insights and advancements.",
                location: "Grand Palais"
            )

            EventDetailView(event: sampleEvent, viewModel: viewModel)
        }
    }
}
