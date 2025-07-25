//
//  EventFilterView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 25/07/2025.

import SwiftUI

struct EventFilterView: View {
    
    @Binding var showingFilterModal: Bool
    
    let options = ["All", "Today", "Tomorrow", "This week", "This month"]
    @State private var selectedIndexOption: Int = 0
    let categories = ["All", "Web / Mobile", "UX/UI", "Data Science & AI", "DevOps"]
    @State private var selectedIndexCategory: Int = 0
    
    private func resetToDefaults() {
        selectedIndexOption = 0
        selectedIndexCategory = 0
    }
    
    private func bindingForOption(index: Int) -> Binding<Bool> {
        Binding(
            get: { self.selectedIndexOption == index },
            set: { newValue in
                if newValue {
                    self.selectedIndexOption = index
                }
            }
        )
    }
    
    private func bindingForCategory(index: Int) -> Binding<Bool> {
        Binding(
            get: { self.selectedIndexCategory == index },
            set: { newValue in
                if newValue {
                    self.selectedIndexCategory = index
                }
            }
        )
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text("Filters")
                    .font(.custom("Safiro-Bold", size: 36))
                    .padding(.leading, 25)
                
                Spacer()
                
                Button(action: {
                    showingFilterModal = false
                }) {
                    Image(systemName: "xmark")
                        .frame(width: 43, height: 43)
                        .foregroundColor(.black)
                        .background(Color("NeonGreen"))
                        .clipShape(Circle())
                }
            }
            .padding(.trailing, 25)
            .padding(.top, 17)
            
            // Carte Date début
            VStack(alignment: .leading, spacing: 10) {
                Text("Date")
                    .font(.custom("Safiro-Bold", size: 22))
                    .padding(.top, 10)
                
                HStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(width: 360, height: 210)
                        .overlay(
                            VStack(spacing: 10) {
                                ForEach(0..<options.count, id: \.self) { index in
                                    HStack {
                                        Text(options[index])
                                            .padding(.leading, 20)
                                        Spacer()
                                        Toggle(
                                            "",
                                            isOn: Binding(
                                                get: {
                                                    selectedIndexOption == index
                                                },
                                                set: { newValue in
                                                    if newValue {
                                                        selectedIndexOption = index
                                                    }
                                                }
                                            )
                                        )
                                        .fixedSize()
                                        .scaleEffect(0.9)
                                        .offset(x: 5)
                                        .tint(Color.violet)
                                        .padding(.trailing, 20)
                                    }
                                }
                            }
                        )
                }
            }
            .padding(.horizontal, 25)
            
            // Carte Categories début
            VStack(alignment: .leading, spacing: 10) {
                Text("Categories")
                    .font(.custom("Safiro-Bold", size: 22))
                    .padding(.top, 10)
                
                HStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(width: 360, height: 210)
                        .overlay(
                            VStack(spacing: 10) {
                                ForEach(0..<categories.count, id: \.self) { index in
                                    HStack {
                                        Text(categories[index])
                                            .padding(.leading, 20)
                                        Spacer()
                                        Toggle(
                                            "",
                                            isOn: Binding(
                                                get: {
                                                    selectedIndexCategory == index
                                                },
                                                set: { newValue in
                                                    if newValue {
                                                        selectedIndexCategory = index
                                                    }
                                                }
                                            )
                                        )
                                        .fixedSize()
                                        .scaleEffect(0.9)
                                        .offset(x: 5)
                                        .tint(Color.violet)
                                        .padding(.trailing, 20)
                                    }
                                }
                            }
                        )
                }
            }
            .padding(.horizontal, 25)
            
            // City
            VStack(alignment: .leading, spacing: 10) {
                Text("City")
                    .font(.custom("Safiro-Bold", size: 22))
                    .padding(.leading, 25)
                    .padding(.top, 15)
                
                HStack {
                    CityView()
                }
            }
            .padding(.trailing, 25)
            
            // Boutons Reset et Apply
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 20) {
                    Spacer()
                    Button(action: {
                        resetToDefaults()
                    }) {
                        Text("Reset")
                            .frame(width: 168, height: 40)
                            .background(Color.violet)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Text("Apply")
                            .frame(width: 168, height: 40)
                            .background(Color.violet)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.bottom, 10)
            }
        }
        .background(Color.background)
    }
}

struct CityView: View {
    let cities = [
        "Paris", "Berlin", "Madrid", "Rome", "Lisbonne", "Bruxelles",
        "Amsterdam",
    ]
    @State private var selectedCity = "Paris"
    
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
    EventFilterView(showingFilterModal: .constant(true))
}

