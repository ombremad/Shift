
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
    var tag: FieldOfInterest //objet class FieldOfInterest
    var datePublication: String
    var imageCouv: String
    var contentArticle: [ElementsContent]
}

let tagModel = fieldOfInterestModel() //Objet qui contient toutes les instances des tag pour acceder à tous
var articlesArray: [Article] = [
    Article(
        titre: "Article Title",
        intro: "Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor.",
        chapeau: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ",
        tag: tagModel.web,
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
        tag: tagModel.web,
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
        tag: tagModel.web,
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
        tag: tagModel.web,
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
