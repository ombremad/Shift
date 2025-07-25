//
//  ArticlesView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct ArticlesView: View {
    
    @State private var viewModel = ArticlesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack (alignment: .leading, spacing: 0){
                Text("What's new ?")
                    .font(.custom("Safiro-Bold", size: 36))
                    .padding(.top, 50)
                    .padding(.bottom, 15)
                    .padding(.leading, 15)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12){
                        ForEach(viewModel.articlesArray.shuffled().prefix(4)) { article in
                            NavigationLink(destination : DetailArticleView(
                                article: article
                            ).environment(viewModel)) {
                                SliderView(article: article)
                            }
                            .navigationBarBackButtonHidden(true)
                        }
                    }
                    .padding(.horizontal)
                }
               
                //Filtres par catégories
                VStack(alignment: .leading, spacing: 12){
                    HStack (spacing: 15){
                        ForEach(viewModel.tagModel.getFieldOfInterestList()) { interest in
                                  Button(action: {
                                      viewModel.selectedFilter = (viewModel.selectedFilter == interest ? nil : interest)
                                  }) {
                                      InterestCardView(
                                        filter: interest,
                                        isSelected: viewModel.selectedFilter == interest
                                      )}
                        }
                    }
                    .padding(.top, 10)
                    // Articles les plus récent
                    Text("Latest")
                        .font(.custom("Safiro-Bold", size: 24))
                        .padding([.top, .bottom], 10)
                    ForEach(viewModel.filteredArticles.prefix(8)) { article in
                        NavigationLink(destination : DetailArticleView(
                            article: article
                        ).environment(viewModel)) {
                            if (article.isBig == true){
                                BigArticleView(article: article)
                            } else {
                                LittleArticlesView(article: article)
                            }
                        }
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 15)
               }
           
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        }
        .tint(.violet)
    }
}

#Preview {
    ArticlesView()
}
