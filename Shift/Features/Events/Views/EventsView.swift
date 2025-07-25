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
    
    @State private var viewModel = EventsViewModel()

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
                        ForEach(viewModel.events, id: \.title) { event in
                            NavigationLink(destination: EventDetailView()) {
                                CardView(event: event)
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
                EventFilterView(showingFilterModal: $showingFilterModal)
            }
            .background(Color.background)
        }
    }
}

#Preview {
    EventsView()
}
