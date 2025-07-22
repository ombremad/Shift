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
        VStack (alignment: .leading){
            Text("What's new ?")
                .font(.custom("Safiro-Bold", size: 36))
//            HStack (spacing: 16){
//            ForEach(SliderView){ NewArticle in
//                    
//                }
           // }
            Text("Latest")
                .font(.custom("Safiro-Medium", size: 24))
          
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
               .background(Color.background)
               .ignoresSafeArea()
    }
}

#Preview {
    ArticlesView()
}
