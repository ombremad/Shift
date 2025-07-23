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
        VStack (alignment: .leading) {
            ZStack{
                Rectangle()
                    .foregroundColor(.blanc)
                    .cornerRadius(15)
                    .frame(width: 241, height: 280)
                    .shadow(color: .gray.opacity(0.5), radius: 0.5, x: 0, y:1)
                VStack (alignment: .leading, spacing: 12){
                    
                    Image(article.imageCouv)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 211, height: 160)
                        .cornerRadius(5)
                        .clipped()
                    Text(article.tag.name)
                        .font(.custom("HelveticaNeue-Bold", size: 12))
                        .foregroundColor(.blanc)
                        .padding(.vertical,6)
                        .padding(.horizontal, 12)
                        .background(Color.violet)
                        .cornerRadius(5)
                        .multilineTextAlignment(.leading) 
                    Text(article.intro)
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundColor(.noir)
                        .multilineTextAlignment(.leading)
                }
                .padding(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .frame(width: 241, height: 280)
        }
    }
}

#Preview {
    SliderView(article:
                    Article(
                        titre: "Article Title",
                        intro: "Jamila works at the intersection of education and cyber defense.",
                        chapeau: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ",
                        tag: .init(name: "web", nameShort: "web", icon: .arrowBendUpLeft),
                        datePublication: "17 juillet 2025",
                        imageCouv: "webMobile-1",
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
