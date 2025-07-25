//
//  InterestCardView.swift
//  Shift
//
//  Created by alize on 22/07/2025.
//


import SwiftUI

struct InterestCardView: View {
    
    var filter: FieldOfInterest
    var isSelected: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 49, height: 49)
                    .foregroundColor(isSelected ? .violet : .neonGreen)
                    .cornerRadius(10)
                
                Image(filter.icon)
                    .frame(width: 49, height: 49)
            }
            
            Text(filter.nameShort)
                .foregroundColor(isSelected ? .blanc : .noir)
                .font(.custom("Helvetica-Courant", size: 13))
        }
    }
}

#Preview {
    HStack {
        InterestCardView(filter: FieldOfInterest(
            name: "Web / Mobile",
            nameShort: "Web",
            icon: .devices
        ), isSelected: false)
        
        InterestCardView(filter: FieldOfInterest(
            name: "Web / Mobile",
            nameShort: "Web",
            icon: .devices
        ), isSelected: true)
    }
}
