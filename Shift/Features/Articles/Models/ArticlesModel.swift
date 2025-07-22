
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
    var isNew : Bool
}
