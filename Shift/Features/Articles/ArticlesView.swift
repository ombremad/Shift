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
                VStack (alignment: .leading, spacing: 12){
                    Text("What's new ?")
                        .font(.custom("Safiro-Bold", size: 36))
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
                    }
                    
                    Text("Latest")
                        .font(.custom("Safiro-Bold", size: 24))
                        .padding([.top, .bottom], 10)
                    ForEach(viewModel.articlesArray.sorted { $0.datePublication > $1.datePublication }.prefix(8)) { article in
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
        }
        .tint(.violet)
    }
}
#Preview {
    ArticlesView()
}
