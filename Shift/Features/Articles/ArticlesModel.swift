
import SwiftUI

enum ElementsContent : Hashable {
    case subtitle1(String)
    case paragraph1(String)
    case image(String)
    case subtitle2(String)
    case paragraph2(String)
}

struct Article : Identifiable {
    let id = UUID()
    var titre: String
    var intro: String
    var chapeau: String
    var tag: String
    var datePublication: String
    var imageCouv: String
    var imageBody: String
    var contentArticle: [ElementsContent]
}

var articlesArray: [Article] = [
    Article(
        titre: "Article Title",
        intro: "Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor.",
        chapeau: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ",
        tag: "Cyber security",
        datePublication: "17 juillet 2025",
        imageCouv: "Image1",
        imageBody: "Image2",
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
        intro: "Lorem ipsum dolor sit amet consectetur adipiscing elit sed.",
        chapeau: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ",
        tag: "Cyber security",
        datePublication: "17 juillet 2025",
        imageCouv: "Image1",
        imageBody: "Image2",
        contentArticle :[
            .subtitle1("Sous titre"),
            .paragraph1("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            .image("Image10"),
            .subtitle2("Sous titre"),
            .paragraph2("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ]
    ),
    
    Article(
        titre: "Article Title",
        intro: "Lorem ipsum dolor sit amet consectetur adipiscing elit sed.",
        chapeau: "Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ",
        tag: "Cyber security",
        datePublication: "17 juillet 2025",
        imageCouv: "Image1",
        imageBody: "Image2",
        contentArticle :[
            .subtitle1("Sous titre"),
            .paragraph1("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            .image("Image10"),
            .subtitle2("Sous titre"),
            .paragraph2("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        ]
    ),
    
    Article(
        titre: "Article Title",
        intro: "Lorem ipsum dolor sit amet consectetur adipiscing elit sed.",
        chapeau: "Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ",
        tag: "Cyber security",
        datePublication: "17 juillet 2025",
        imageCouv: "Image1",
        imageBody: "Image2",
        contentArticle :[
            .subtitle1("Sous titre"),
            .paragraph1("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            .image("Image10"),
            .subtitle2("Sous titre"),
            .paragraph2("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        ]
    ),
]
