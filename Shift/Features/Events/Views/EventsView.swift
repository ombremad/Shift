//
//  EventsView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct EventsView: View {

    @State private var searchEvent: String = ""
    @State private var showingFilterModal = false

    @State private var selectedTab = 0
    let tabs = ["Filtered Events", "My Events", "Favorites"]

    let staticData = [
        ["Card 1", "Card 2", "Card 3", "Card 4", "Card 5"],
        ["Card A", "Card B", "Card C", "Card D"],
        ["Card X", "Card Y", "Card Z"],
    ]

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .violet
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor: UIColor.white],
            for: .selected
        )
        UISegmentedControl.appearance().backgroundColor = UIColor.blanc
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Events")
                    .font(.custom("Safiro-Bold", size: 36))
                    .padding(.leading, 25)

                HStack {

                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 310, height: 40)

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
                        showingFilterModal.toggle()
                    }) {
                        Image("faders")
                            .frame(width: 42, height: 40)
                            .background(Color("NeonGreen"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(.black)
                    }

                }
                .padding(.leading, 25)

                HStack {
                    Picker("", selection: $selectedTab) {
                        ForEach(0..<tabs.count, id: \.self) { index in
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
                    VStack(spacing: 15) {
                        ForEach(staticData[selectedTab], id: \.self) { item in
                            NavigationLink(destination: EventDetailView()) {
                                CardView(title: item)
                            }
                        }
                    }
                    .padding(.vertical, 10)
                }
                .scrollIndicators(.hidden)
                .padding()
                .padding(.top, 19)
            }
            .sheet(isPresented: $showingFilterModal) {
                FilterModalView(showingFilterModal: $showingFilterModal)
            }
            .background(Color.background)
        }
    }
}

struct CardView: View {
    let title: String;
    @State private var showAlert = false;

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                Color.white
                    .frame(width: 368, height: 277)
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.20), radius: 2, x: 0, y: 2)

                VStack(spacing: 0) {
                    ZStack(alignment: .topTrailing) {
                        // Image
                        Image(.image9)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 368, height: 193)
                            .clipped()
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 15,
                                    topTrailingRadius: 15
                                )
                            )

                        // Icons section
                        HStack(spacing: 2) {

                            Button(action: {
                                showAlert = true
                            }) {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.noir)
                                    .padding(10)
                                    .background(Color.neonGreen)
                                    .clipShape(Circle())
                                    .padding([.top, .trailing], 10)
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Succès"),
                                    message: Text("L'événement a été partagé avec succès."),
                                    dismissButton: .default(Text("OK"))
                                )
                            }

                            Button(action: {
                                print("Bouton cliqué sur le coeur")
                            }) {
                                Image(systemName: "heart")
                                    .foregroundColor(.noir)
                                    .padding(10)
                                    .background(Color.neonGreen)
                                    .clipShape(Circle())
                                    .padding([.top, .trailing], 10)
                            }
                        }
                        .padding(.top, 135)
                    }
                    .frame(width: 368, height: 193)

                    // Footer card
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Title Event")
                                .font(.custom("Safiro-Bold", size: 16))
                                .foregroundColor(Color.noir)

                            HStack {
                                Text("Date")
                                Text("-")
                                Text("Location")
                            }
                            .font(.custom("Safiro-regular", size: 14))
                            .foregroundColor(Color.noir)
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
        }
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

struct FilterModalView: View {

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
                                ForEach(0..<options.count, id: \.self) {
                                    index in
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
                                                        selectedIndexOption =
                                                            index
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
                                ForEach(0..<categories.count, id: \.self) {
                                    index in
                                    HStack {
                                        Text(categories[index])
                                            .padding(.leading, 20)
                                        Spacer()
                                        Toggle(
                                            "",
                                            isOn: Binding(
                                                get: {
                                                    selectedIndexCategory
                                                        == index
                                                },
                                                set: { newValue in
                                                    if newValue {
                                                        selectedIndexCategory =
                                                            index
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



#Preview {
    EventsView()
}
