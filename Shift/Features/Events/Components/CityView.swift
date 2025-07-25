//
//  CityView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 25/07/2025.
//

import SwiftUI

struct CityView: View {
    
    @Binding var selectedCity: String
    let cities: [String]
    
    var body: some View {
        HStack {
            Menu {
                ForEach(cities, id: \.self) { city in
                    Button(action: {
                        selectedCity = city
                    }) {
                        Text(city)
                    }
                }
            } label: {
                HStack {
                    Text(selectedCity)
                        .foregroundColor(.black)
                        .font(.custom("Safiro-Regular", size: 14))
                        .padding(.leading, 15)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.black)
                        .padding(.trailing, 15)
                }
                .frame(width: 360, height: 40)
                .background(Color.white)
            }
            .cornerRadius(10)
        }
        .padding(.leading, 25)
    }
}

#Preview {
    CityView(
        selectedCity: .constant("Paris"),
        cities: ["All", "Paris", "Berlin", "Madrid", "Rome", "Lisbonne", "Bruxelles", "Amsterdam"]
    )
}
