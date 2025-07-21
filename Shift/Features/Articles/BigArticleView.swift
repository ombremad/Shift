//
//  BigArticleView.swift
//  test
//
//  Created by alize on 17/07/2025.
//

import SwiftUI

struct BigArticleView: View {
    let article : Article
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading){
               
                Image(article.imageCouv)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: 370 , height: 271)
                    .cornerRadius(15)
                    .shadow( color: .gray.opacity(0.5), radius: 1, x: 0, y: 0.5)
                Rectangle() //filtre noir (pour visibilité du texte)
                    .cornerRadius(15)
                    .foregroundColor(.black.opacity(0.3))
                    .frame(width: 370, height: 271)
                VStack (alignment: .leading, spacing: 12){
                    Spacer()
                    Text(article.tag.name)
                        .foregroundColor(.blanc)
                        .font(.custom("HelveticaNeue-Bold", size: 11))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.violet)
                        .cornerRadius(5)
                        .padding(.bottom, 8)
                    Text(article.intro)
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundColor(.blanc)
                        .frame(width: 162)
                   
                }
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
        }
        .frame(width: 370 , height: 271)
        .padding()
    }
}

#Preview {
    BigArticleView(article: FakeData.articles[0])
}
