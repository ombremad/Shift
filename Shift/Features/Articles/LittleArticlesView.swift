//
//  LittleCardArticleView.swift
//  test
//
//  Created by alize on 17/07/2025.
//

import SwiftUI

struct LittleArticlesView: View {
    
    let article: Article
    
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .frame(width: 370 , height: 144 )
                    .foregroundColor(.blanc)
                    .cornerRadius(15)
                    .shadow( color: .gray.opacity(0.5), radius: 1, x: 0, y: 0.5)
                HStack{
                    
                    Image(article.imageCouv)
                        .resizable()
                        .aspectRatio (contentMode: .fill)
                        .clipped()
                        .frame(width: 175, height: 114)
                        .cornerRadius(10)
                    Spacer()
                    
                    VStack (alignment: .leading, spacing: 10){
                        
                        Text(article.tag.name)
                            .font(.custom("HelveticaNeue-Bold", size: 11))
                            .foregroundColor(.blanc)
                            .padding(.vertical,6)
                            .padding(.horizontal, 12)
                            .background(Color.violet)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                        
                        Text(article.intro)
                            .font(.custom("HelveticaNeue-bold", size: 14))
                    }
                }
                .padding(15)
                .frame(width: 370 , height: 144 )
            }

        }
    }
}

#Preview {
    LittleArticlesView(article: articlesArray[0] )
}
