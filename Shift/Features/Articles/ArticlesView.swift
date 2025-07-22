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
            VStack (alignment: .leading){
                Text("What's new ?")
                    .font(.custom("Safiro-Bold", size: 36))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.articlesArray) { article in
                            SliderView(article: article)
                        }
                    }
                }
                Text("Latest")
                    .font(.custom("Safiro-Bold", size: 24))
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
            .ignoresSafeArea()
        }
    }
}
    #Preview {
        ArticlesView()
    }
