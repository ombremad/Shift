//
//  EventsView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct EventsView: View {
    
    @State private var searchEvent: String = "";
    @State private var showingFilterModal = false;
    
    @State private var selectedTab = 0;
    let tabs = ["All", "My Events", "Favorites"];
    
    let staticData = [
        ["Card 1", "Card 2", "Card 3", "Card 4", "Card 5"],
        ["Card A", "Card B", "Card C", "Card D"],
        ["Card X", "Card Y", "Card Z"]
    ];

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .violet;
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected);
        UISegmentedControl.appearance().backgroundColor = .white;
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Events")
                .font(.custom("Safiro-Bold", size: 36))
                .padding(.leading, 10)

            HStack {

                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 316, height: 40)

                    Image("magnifying-glass")
                        .frame(width: 40, height: 40)
                        .background(Color("NeonGreen"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    TextField("Search", text: $searchEvent)
                        .font(.custom("Helvetica Neue", size: 14))
                        .padding(.leading, 50)
                        .frame(width: 316, height: 40)
                }

                Button(action: {
                    showingFilterModal.toggle();
                }) {
                    Image("faders")
                        .frame(width: 42, height: 40)
                        .background(Color("NeonGreen"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.black)
                }
                .padding(.leading, 10)
            }
            .padding(.leading, 10)

            HStack {
                Picker("", selection: $selectedTab) {
                    ForEach(0 ..< tabs.count, id: \.self) { index in
                        Text(self.tabs[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 370, height: 43)
                .cornerRadius(10)
            }
            .padding(.top, 28)
            .padding(.leading, 12)
            
            ScrollView {
                VStack {
                    ForEach(staticData[selectedTab], id: \.self) { item in
                        CardView(title: item)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding()
            .padding(.top, 19)
            
            
        }
        .padding()
        .sheet(isPresented: $showingFilterModal) {
            FilterModalView(showingFilterModal: $showingFilterModal)
        }
        .background(Color.background)
    }
}


struct CardView: View {
    let title: String;
    
    var body: some View {
        Text(title)
            .frame(width: 368, height: 277)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
            .shadow(radius: 10)
    }
}

struct CityView: View {
    let cities = ["Paris", "Berlin", "Madrid", "Rome", "Lisbonne"]
    @State private var selectedCity = "Paris";

    var body: some View {
        HStack {
            Picker("Select a city", selection: $selectedCity) {
                ForEach(cities, id: \.self) { city in
                    Text(city).tag(city)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(width: 352, height: 40)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
        .padding(.leading, 25)
    }
}



struct FilterModalView: View {
    @Binding var showingFilterModal: Bool
    
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
                    .padding(.leading, 25)

                HStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 353, height: 181)
                        .padding(.leading, 25)
                }
            }
            .padding(.trailing, 25)
            
            
            // Carte Categories début
            VStack(alignment: .leading, spacing: 10) {
                Text("Categories")
                    .font(.custom("Safiro-Bold", size: 22))
                    .padding(.top, 10)
                    .padding(.leading, 25)

                HStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 353, height: 181)
                        .padding(.leading, 25)
                }
            }
            .padding(.trailing, 25)
            
            
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
                .padding(.top, 60)
            }
        }
        // Fin
        Spacer()
    }
}

#Preview {
    EventsView()
}
