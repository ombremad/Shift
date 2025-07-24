//
//  InspirationCard.swift
//  Shift
//
//  Created by Samara Lima da Silva on 18/07/2025.
//

import SwiftUI

struct InspirationCard: View {
    let woman: Inspirations
    var isOpen: Bool = true
    
    var body: some View {
        HStack() {
 //MARK: - Opened card
            if isOpen {
                ZStack() {
                    Circle()
                        .fill(Color("NeonGreen"))
                        .frame(width: 174, height: 174)
                        .opacity(0.15)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 144, height: 144)
                        .opacity(0.30)
                    
                    Image(woman.imageWhite)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .frame(width: 120, height: 120)
                }
                .frame(width: 174, height: 174)
                .padding(.leading, 15)
                .padding(.vertical, 15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(woman.name)
                        .font(.custom("Safiro-SemiBold", size: 22))
                        .foregroundColor(.white)
                    
                    Text(woman.lifeSpan)
                        .font(.custom("Safiro-SemiBold", size: 14))
                        .foregroundColor(Color("Violet"))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 2)
                        .background(Color("NeonGreen"))
                        .cornerRadius(25)
                    
                    Text(woman.achievement)
                        .font(.custom("HelveticaNeue", size: 14))
                        .foregroundColor(.white)
                    
                    Text("See more")
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundColor(.white)
                        .underline()
                    
                }
                .padding(.leading, 17)
                
                Spacer()
                
 //MARK: - Closed card
            }else {
                ZStack{
                    Circle()
                        .fill(Color.white)
                        .frame(width: 47, height: 47)
                        .opacity(0.15)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 39, height: 39)
                        .opacity(0.30)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 30, height: 30)
                }
                .frame(width: 174, height: 174)
                .padding(.leading, 15)
                .padding(.vertical, 15)
                
             VStack (alignment: .leading, spacing: 10) {
                 Text(woman.name)
                     .font(.custom("Safiro-SemiBold", size: 22))
                     .foregroundColor(.white)
                 
                 Text(woman.lifeSpan)
                     .font(.custom("Safiro-SemiBold", size: 14))
                     .foregroundColor(Color("Violet"))
                     .padding(.horizontal, 10)
                     .padding(.vertical, 2)
                     .background(Color("NeonGreen"))
                     .cornerRadius(25)
                }
             .frame(width: 174, height: 174, alignment: .leading)
             .padding(.horizontal, 14)
            }
        }
//        .background(Color.purple)
    }
}

#Preview {
    VStack {
        InspirationCard(
            woman:
                Inspirations(
                    id: 1,
                    name: "Ada Lovelace",
                    field: "Mathematician",
                    imageWhite: "ada_lovelace",
                    imageGreen: "ada_lovelace_g",
                    birth: "December 10, 1815, England",
                    death: "November 27, 1852, England",
                    achievement: "First computer programer First computer programer",
                    biography: "Ada Lovelace ",
                    whyInspiring: "She saw a future where"
                )
        )
        InspirationCard(
            woman:
                Inspirations(
                    id: 1,
                    name: "Ada Lovelace",
                    field: "Mathematician",
                    imageWhite: "ada_lovelace",
                    imageGreen: "ada_lovelace_g",
                    birth: "December 10, 1815, England",
                    death: "November 27, 1852, England",
                    achievement: "First computer programer",
                    biography: "Ada Lovelace was a 19th-century visionary who worked on Charles Babbage’s Analytical Engine.",
                    whyInspiring: "She saw a future where computers could create music, art, and more."
                ), isOpen: false
        )
    }
}

