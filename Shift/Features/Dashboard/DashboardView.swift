//
//  DashboardView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = InspirationsViewModel()
    @State var forumViewModel = ForumViewModel()
    @State private var articlesViewModel = ArticlesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    // MARK: - Welcome User
                    
                    // TODO: - Add logic to recover current user's image and name
                    HStack(spacing: 12) {
                        Image("ProfileImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 52, height: 52)
                            .clipShape(Circle())
                        
                        Text("Welcome Julie")
                            .font(.custom("Safiro-SemiBold", size: 32))
                    }
                    
                    // MARK: - Profile
                    NavigationLink(destination: ProfilView()) {
                        Text("My profile")
                            .font(.custom("Safiro-SemiBold", size: 14))
                            .foregroundColor(.black)
                            .frame(maxWidth: 236)
                            .frame(height: 40)
                            .background(Color("NeonGreen"))
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 23)
                    .padding(.top, -10)
                    .tint(.violet)
                    
                    // MARK: - Daily Inspiration
                    Text("Daily Inspiration")
                        .font(.custom("Safiro-SemiBold", size: 24))
                        .padding(.bottom, 13)
                    
                    
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
                        .padding(.top, 20)
                    VStack{
                        ForEach(articlesViewModel.sortedByDate(array: articlesViewModel.articlesArray).prefix(2)) { article in
                            NavigationLink(destination : DetailArticleView(
                                article: article
                            ).environment(articlesViewModel)) {
                                LittleArticlesView(article : article, fromDashboard: true)
                            }
                        }
                    }
                   
                     // MARK: - Hot Topics
//                    Text("Hot Topics")
//                        .font(.custom("Safiro-SemiBold", size: 24))
//                    
//                    VStack (spacing: 30){
//                        ForEach(forumViewModel.getHotPosts()) { post in
//                            NavigationLink(destination: ForumSingleView(currentUser: forumViewModel.user.getCurrentUser(), post: post)) {
//                                ForumCard(
//                                    post: post,
//                                    backgroundColor: Color("Violet"),
//                                    textColor: .white
//                                )
//                                .frame(width: 371, height: 122)
//                            }
//                        }
//                    }
//                    .padding(.bottom, 40)
//                    .padding(.top, 15)
                    
                      
                    // MARK: - Events
                    Text("Popular events")
                        .font(.custom("Safiro-SemiBold", size: 24))
                    
                }
                .padding(.top)
                .padding(.leading, 20)
                
            }
            .background(Color("Background")
                .ignoresSafeArea())
            
        }
        .tint(.noir)
    }
}


#Preview {
    DashboardView()
}
