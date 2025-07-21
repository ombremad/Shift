//
//  FakeData.swift
//  Shift
//
//  Created by alize on 21/07/2025.
//

import Foundation

class FakeData {    
    static var articles = [
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
            ]
        ),
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
              ]
          ),
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
              ]
          ),
    ]
}
