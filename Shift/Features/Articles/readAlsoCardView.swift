//
//  readAlsoCardView.swift
//  Shift
//
//  Created by alize on 18/07/2025.
//

import SwiftUI

struct ReadAlsoView: View {
    
    let article: Article
    
    var body: some View {
        HStack (spacing: 15){
            
            ZStack{
                Rectangle()
                    .foregroundColor(.blanc)
                    .frame(width: 176, height: 246)
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 0.5)
                VStack (alignment: .leading, spacing: 8){
                    Image(article.imageCouv)
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 151, height: 123)
                        .cornerRadius(10)
                    Text(article.tag.name)
                        .foregroundColor(.white)
                        .font(.custom("HelveticaNeue-Bold", size: 11))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.violet)
                        .cornerRadius(5)
                    Text(article.intro)
                        .font(.custom("Helvetica-Bold", size: 14))
                        .foregroundColor(.noir)
                }
               .padding(15)
            }
            .frame(width: 151, height: 123)
        }
    }
}
#Preview {
    ReadAlsoView(article: articlesArray[0])
}
