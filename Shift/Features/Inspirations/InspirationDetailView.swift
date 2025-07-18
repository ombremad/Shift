//
//  InspirationDetailView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import SwiftUI

struct InspirationDetailView: View {
    let woman: Inspirations

    var body: some View {
           ScrollView {
               VStack(alignment: .leading, spacing: 16) {
                   
                   Image(woman.imageName)
                       .resizable()
                       .scaledToFit()
                       .cornerRadius(12)
                       .shadow(radius: 5)
                   
                  //MARK: Name + Field
                       Text(woman.name)
                           .font(.title)
                           .bold()
                       
                       Text(woman.field)
                           .font(.headline)
                           .foregroundColor(.secondary)
                       
                  //MARK: Birth – Death - Achievement
                       HStack{
                       Image("baby")
                       Text(woman.birth)
                       }
                       HStack{
                       Image("cross")
                       Text(woman.death ?? "Present")
                       }
                       HStack{
                       Image("sketch-logo")
                       Text(woman.achievement)
                       }
                   
                   //MARK: Biography
                   Text("Biography")
                       .font(.title2)
                       .bold()
                   Text(woman.biography)
                       .font(.body)
                       .multilineTextAlignment(.leading)
                   
                   //MARK: Why Inspiring
                   Text("Why She's Inspiring")
                       .font(.title2)
                       .bold()
                   Text(woman.whyInspiring)
                       .font(.body)
                       .multilineTextAlignment(.leading)
               }
               .padding()
           }
           .navigationTitle(woman.name)
           .navigationBarTitleDisplayMode(.inline)
       }
   }

#Preview {
    InspirationDetailView(woman: Inspirations(
        id: 1,
        name: "Ada Lovelace",
        field: "Mathematician",
        imageName: "ada_lovelace",
        birth: "December 10, 1815, England",
        death: "November 27, 1852, England",
        achievement: "First computer programer",
        biography: "Ada Lovelace was a 19th-century visionary who worked on Charles Babbage’s Analytical Engine.",
        whyInspiring: "She saw a future where computers could create music, art, and more."
    ))
}
