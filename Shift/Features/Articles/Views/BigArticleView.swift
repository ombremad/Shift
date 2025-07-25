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
                        .font(.custom("HelveticaNeue-Bold", size: 12))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.violet)
                        .cornerRadius(5)
                        .padding(.bottom, 8)
                    Text(article.intro)
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundColor(.blanc)
                        .multilineTextAlignment(.leading)
                        .frame(width: 162)
                }
                .padding(.bottom, 20)
                .padding(.leading, 15)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
        }
        .frame(width: 370 , height: 271)
    }
}

#Preview {
    BigArticleView(article : Article(
        titre: "Article Title",
        intro: "Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor.",
        chapeau: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ",
        tag: .init(name: "web", nameShort: "web", icon: .arrowBendUpLeft),
        datePublication: "17 juillet 2025",
        imageCouv: "big",
        contentArticle :[
            .subtitle1("Sous titre"),
            .paragraph1("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            .image("Image10"),
            .subtitle1("Sous titre"),
            .paragraph2("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ],
        isBig: true,
        isOnSlider: false
    )
    )
}
