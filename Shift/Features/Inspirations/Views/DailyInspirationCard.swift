//
//  DailyInspirationCard.swift
//  Shift
//
//  Created by Samara Lima da Silva on 27/07/2025.
//

import SwiftUI

struct DailyInspirationCard: View {
    let woman: Inspirations
    
    var body: some View {
        HStack(spacing: 20) {
            //MARK: - Circle with image
            ZStack {
                Circle()
                    .fill(Color("NeonGreen").opacity(0.1))
                    .frame(width: 171, height: 171)
                Circle()
                    .fill(Color("NeonGreen").opacity(0.3))
                    .frame(width: 141, height: 141)
                Circle()
                    .fill(Color("NeonGreen").opacity(0.7))
                    .frame(width: 116, height: 116)
                Image(woman.imageGreen)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 88)
                    .clipShape(Circle())
            }
            //MARK: - Name and description
            VStack(alignment: .leading, spacing: 15) {
                Text(woman.name)
                    .font(.custom("Safiro-SemiBold", size: 18))
                    .foregroundColor(.white)
                
                Text(woman.whyInspiring)
                    .font(.custom("HelveticaNeue", size: 14))
                    .foregroundColor(.white)
                    .lineLimit(4)
                
                Text("See more")
                    .font(.custom("HelveticaNeue-Bold", size: 12))
                    .foregroundColor(.white)
                    
            }
            .frame(width:156, height: 139, alignment: .leading)
            
        }
        .padding()
        .background(Color("Violet"))
        .cornerRadius(15)
        .frame(width:362, height: 201)
    }
}


#Preview {
    DailyInspirationCard(
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
                whyInspiring: "She saw a future where She saw a future where She saw a future where She saw a future where She saw a future where She saw a future where She saw a future where"
            )
    )
}
