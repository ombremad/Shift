//
//  DetailArticleViiew.swift
//  test
//
//  Created by alize on 17/07/2025.
//

import SwiftUI

struct DetailArticleView: View {
    
    let article : Article
    @State private var viewModel = ArticlesViewModel()
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading , spacing: 5){ //titre + date
                Text(article.titre)
                    .font(.custom("Safiro-Bold", size: 36))
                Text("Publié le \(article.datePublication)")
                    .font(.custom("HelveticaNeue-Courant", size: 14))
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack (alignment: .bottomTrailing){//image pleine largeur
                Image(article.imageCouv)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(maxWidth: .infinity, maxHeight: 286)
                
                HStack(){ //pictos
                    ZStack{ //share
                        Circle()
                            .frame(width: 35)
                            .foregroundColor(.neonGreen)
                        Image("share")
                            .resizable()
                            .frame(width: 13, height: 15)
                    }
                    ZStack{ //like (favoris)
                        Circle()
                            .frame(width: 35)
                            .foregroundColor(.neonGreen)
                        Image("heart")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
                .padding(.trailing, 15)
                .padding(.bottom, 15)
            }
            VStack (alignment: .leading, spacing: 15){
                Text(article.tag.name)
                    .foregroundColor(.white)
                    .font(.custom("HelveticaNeue-Bold", size: 11))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .background(.violet)
                    .cornerRadius(5)
                Text(article.chapeau)
                    .font(.custom("Safiro-Bold", size: 18))
                
                //Logique pour afficher content page personnalisé
                ForEach(article.contentArticle, id: \.self) { content in
                    switch content {
                    case .subtitle1(let subtitle1):
                        Text(subtitle1)
                            .font(.custom("Safiro-Bold", size: 18))
                            .foregroundColor(.noir)
                    case .paragraph1(let paragraph1):
                        Text(paragraph1)
                            .font(.custom("HelveticaNeue-Courant", size: 14))
                            .foregroundColor(.noir)
                    case .image(let image):
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(maxWidth: .infinity, maxHeight: 286)
                            .cornerRadius(15)
                    case .subtitle2(let subtitle2) :
                        Text(subtitle2)
                            .font(.custom("Safiro-Bold", size: 18))
                            .foregroundColor(.noir)
                    case .paragraph2(let paragraph2):
                        Text(paragraph2)
                            .font(.custom("HelveticaNeue-Courant", size: 14))
                    }
                }
                VStack (alignment: .leading){
                    Text("Read also")
                        .foregroundColor(.noir)
                        .font(.custom("Safiro-Bold", size: 22))
                    
                    HStack(spacing: 15) {
                        ForEach(viewModel.FilteredArticles(currentArticle: article).prefix(2), id: \.id) { articleFiltered in
                            NavigationLink(destination: DetailArticleView(article:  articleFiltered )) {
                                ReadAlsoView(article: articleFiltered)
                                    .contentShape(Rectangle())
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .padding(15)
        }
    }
}
#Preview {
    NavigationView {
        DetailArticleView(article:
                            Article(
                                titre: "Article Title",
                                intro: "Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor.",
                                chapeau: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ",
                                tag: .init(name: "web", nameShort: "web", icon: .arrowBendUpLeft),
                                datePublication: "17 juillet 2025",
                                imageCouv: "Image1",
                                contentArticle :[
                                    .subtitle1("Sous titre"),
                                    .paragraph1("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                                    .image("Image10"),
                                    .subtitle1("Sous titre"),
                                    .paragraph2("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                                ],
                                isNew: true
            )
        )
    }
}
