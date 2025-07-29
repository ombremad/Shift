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
    @State private var viewModel = EventsViewModel();
    
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

                SearchBar(searchEvent: $searchEvent, showingFilterModal: $showingFilterModal)
            
                TabPickerView(selectedTab: $viewModel.selectedTab, tabs: viewModel.tabs, viewModel: viewModel)
                .padding(.top, 28)

                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.filteredEvents, id: \.title) { event in
                            NavigationLink(destination: EventDetailView(event: event)) {
                                CardView(event: event) {
                                    viewModel.toggleLike(for: event.id)
                                }
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
                EventFilterView(
                    viewModel: viewModel,
                    showingFilterModal: $showingFilterModal,
                    selectedTab: selectedTab
                )
            }
            .background(Color.background)
        }
    }

    #Preview {
        EventsView()
    }
}
