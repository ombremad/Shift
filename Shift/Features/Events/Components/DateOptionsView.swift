//
//  DateOptionsView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 25/07/2025.
//

import SwiftUI

struct DateOptionsView: View {
    @Bindable var viewModel: EventsViewModel
    
    private func bindingForDateOption(index: Int) -> Binding<Bool> {
        Binding(
            get: { viewModel.selectedDateOption == index },
            set: { newValue in
                if newValue {
                    viewModel.selectedDateOption = index
                    viewModel.applyFilters(selectedTab: 0)
                }
            }
        )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Date")
                .font(.custom("Safiro-Bold", size: 22))
                .padding(.top, 10)
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: 360, height: 210)
                .overlay(
                    VStack(spacing: 10) {
                        ForEach(0..<viewModel.options.count, id: \.self) { index in
                            HStack {
                                Text(viewModel.options[index])
                                    .padding(.leading, 20)
                                Spacer()
                                Toggle("", isOn: bindingForDateOption(index: index))
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
        .padding(.horizontal, 25)
    }
}

struct DateOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EventsViewModel()
        DateOptionsView(viewModel: viewModel)
    }
}
