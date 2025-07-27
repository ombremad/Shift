//
//  DashboardView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = InspirationsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    // MARK: - Welcome User
                    
               // TODO: - Add logic to recover current user's image and name
                    HStack(spacing: 12) {
                        Image("ada_lovelace_g")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 52, height: 52)
                            .clipShape(Circle())
                        
                        Text("Welcome Julie")
                            .font(.custom("Safiro-SemiBold", size: 32))
                    }
                    
                    // MARK: - Profile
                    NavigationLink(destination: ProfileView()) {
                        Text("My profile")
                            .font(.custom("Safiro-SemiBold", size: 14))
                            .foregroundColor(.black)
                            .frame(maxWidth: 236)
                            .frame(height: 40)
                            .background(Color("NeonGreen"))
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 33)
                    
                    // MARK: - Daily Inspiration
                    Text("Daily Inspiration")
                        .font(.custom("Safiro-SemiBold", size: 24))
                        .padding(.bottom, 15)
                    
                    
                    if let woman = viewModel.selectedWoman,
                       let index = viewModel.women.firstIndex(where: { $0.id == woman.id }) {
                        
                        NavigationLink(
                            destination: InspirationDetailView(
                                women: viewModel.women,
                                currentIndex: index
                            )
                        ) {
                            DailyInspirationCard(woman: woman)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                        
                    
                    // MARK: - Latest Articles
                    Text("Latest Articles")
                        .font(.custom("Safiro-SemiBold", size: 24))
                        .padding(.top, 40)
                    
                    // MARK: - Hot Topics
                    Text("Hot Topics")
                        .font(.custom("Safiro-SemiBold", size: 24))
                    
                    // MARK: - Events
                    Text("Popular events")
                        .font(.custom("Safiro-SemiBold", size: 24))
                    
                }
                .padding(.top)
                .padding(.horizontal, 20)
                
            }
            .background(Color("Background")
            .ignoresSafeArea())
        }
    }
}


#Preview {
    DashboardView()
}
