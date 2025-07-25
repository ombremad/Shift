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
                HStack (spacing: 15){
                    Image(article.imageCouv)
                        .resizable()
                        .aspectRatio (contentMode: .fill)
                        .clipped()
                        .frame(width: 175, height: 114)
                        .cornerRadius(10)
                    VStack (alignment: .leading, spacing: 10){
                        
                        Text(article.tag.name)
                            .font(.custom("HelveticaNeue-Bold", size: 12))
                            .foregroundColor(.blanc)
                            .padding(.vertical,6)
                            .padding(.horizontal, 12)
                            .background(Color.violet)
                            .cornerRadius(5)
                            .padding(.bottom, 10)
                        
                        Text(article.intro)
                            .font(.custom("HelveticaNeue-bold", size: 14))
                            .foregroundColor(.noir)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .frame(width: 370 , height: 144 )
        }
    }
}

#Preview {
    LittleArticlesView(article:
                        Article(
                            titre: "Article Title",
                            intro: "Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor.",
                            chapeau: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ",
                            tag: .init(name: "web", nameShort: "web", icon: .arrowBendUpLeft),
                            datePublication: "17 juillet 2025",
                            imageCouv: "webMobile-1",
                            contentArticle :[
                                .subtitle1("Sous titre"),
                                .paragraph1("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                                .image("webMobile-2"),
                                .subtitle1("Sous titre"),
                                .paragraph2("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                            ],
                            isBig: false,
                            isOnSlider: false
                        )
        
    )
}
