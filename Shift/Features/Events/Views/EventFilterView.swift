//
//  EventFilterView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 25/07/2025.
//

import SwiftUI

struct EventFilterView: View {
    
    @Bindable var viewModel: EventsViewModel;
    @Binding var showingFilterModal: Bool;

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
            
            DateOptionsView(viewModel: viewModel)
            
            CategoryOptionsView(viewModel: viewModel)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("City")
                    .font(.custom("Safiro-Bold", size: 22))
                    .padding(.leading, 25)
                    .padding(.top, 15)
                
                HStack {
                    CityView(selectedCity: $viewModel.selectedCity, cities: viewModel.cities)
                }
            }
            .padding(.trailing, 25)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 20) {
                    Spacer()
                    Button(action: {
                        viewModel.resetToDefaults()
                    }) {
                        Text("Reset")
                            .frame(width: 168, height: 40)
                            .background(Color.violet)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        let selectedCategories = viewModel.selectedIndexCategory.isEmpty ?
                        nil :
                        viewModel.selectedIndexCategory.map { viewModel.categories[$0] }
                        
                        viewModel.filterEvents(
                            byCategories: selectedCategories,
                            byCity: viewModel.selectedCity == "All" ? nil : viewModel.selectedCity
                        )
                        showingFilterModal = false
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

struct EventFilterView_Previews: PreviewProvider {
    static var previews: some View {
        EventFilterView(viewModel: EventsViewModel(), showingFilterModal: .constant(true))
    }
}
