//
//  SliderView.swift
//  test
//
//  Created by alize on 17/07/2025.
//

import SwiftUI

struct SliderView: View {
    let article : Article
    
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(.blanc)
                    .cornerRadius(15)
                    .frame(width: 241, height: 270)
                    .shadow(color: .gray.opacity(0.5), radius: 0.5, x: 0, y:1)
                VStack (alignment: .leading, spacing: 12){
                    
                        Image(article.imageCouv)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 211, height: 148)
                            .cornerRadius(5)
                            .clipped()
                    Text(article.tag.name)
                            .font(.custom("HelveticaNeue-Bold", size: 11))
                            .foregroundColor(.blanc)
                            .padding(.vertical,6)
                            .padding(.horizontal, 12)
                            .background(Color.violet)
                            .cornerRadius(5)
                    Text(article.intro)
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundColor(.noir)
                }
                .padding([.leading, .trailing, .bottom], 15)
                .padding(.top, 11)
                .frame(width: 241, height: 258)
            }
        }
    }
}

#Preview {
    BigArticleView(article: FakeData.articles[0])
}
