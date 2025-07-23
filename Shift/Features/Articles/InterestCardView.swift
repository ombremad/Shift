//
//  InterestCardView.swift
//  Shift
//
//  Created by alize on 22/07/2025.
//


import SwiftUI

struct InterestCardView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 49, height: 49)
                .foregroundColor(.neonGreen)
                .cornerRadius(10)
            Image("devices")
                .frame(width: 49, height: 49)
        }
        Text("filter view")
            .foregroundColor(.noir)
            .font(.custom("Helvetica-Courant", size: 13))
    }
}

#Preview {
    InterestCardView()
}
