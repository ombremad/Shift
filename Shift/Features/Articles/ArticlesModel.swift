
import SwiftUI

struct Article : Identifiable {
    let id = UUID()
    var titre: String
    var chapeau: String
    var tag: String
    var datePublication: String
    var image: String
}

var articlesArray: [Article] = [
    Article(titre: "Article Title", chapeau: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ", tag: "Cyber security", datePublication: "17 juillet 2025", image: "image1"),
    Article(titre: "Article Title", chapeau: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore. ", tag: "Cyber security", datePublication: "17 juillet 2025", image: "image1"),
    
]
