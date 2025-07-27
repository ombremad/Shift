//
//  TabPickerView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 27/07/2025.
//

import SwiftUI

struct TabPickerView: View {
    
    @Binding var selectedTab: Int;
    
    let tabs: [String];
    let viewModel: EventsViewModel;
    
    var body: some View {
        HStack {
            Spacer()
            Picker("", selection: $selectedTab) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Text(tabs[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 370, height: 43)
            .cornerRadius(10)
            .onChange(of: selectedTab) { oldValue, newValue in
                viewModel.filterEventsForTab(selectedTab: newValue)
            }
            Spacer()
        }
    }
}

#Preview {
    let viewModel = EventsViewModel();
    
    return TabPickerView(
        selectedTab: .constant(0),
        tabs: viewModel.tabs,
        viewModel: viewModel
    )
}
