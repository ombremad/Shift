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
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 0.5)
                VStack (alignment: .leading, spacing: 8){
                    Image(article.imageCouv)
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 151, height: 126)
                        .cornerRadius(10)
                    //                        .frame(height: 123)
                    //                        .frame(maxWidth: .infinity)
                    Text(article.tag.name)
                        .foregroundColor(.white)
                        .font(.custom("HelveticaNeue-Bold", size: 12))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(.violet)
                        .cornerRadius(5)
                    Spacer()

                    Text(article.intro)
                        .font(.custom("Helvetica-Bold", size: 14))
                        .foregroundColor(.noir)
                }
                .padding(15)
            }
            .frame(width: 176, height: 246)
            .contentShape(Rectangle()) // rend toute la carte interactive
        }
    }
}
#Preview {
    ReadAlsoView(article:
                    Article(
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
                        isNew: true,
                        isBig: false
                    )
                   
                   
    )
}
