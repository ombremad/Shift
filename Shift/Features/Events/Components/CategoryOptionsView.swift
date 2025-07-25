//
//  CityView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 25/07/2025.
//

import SwiftUI

struct CategoryOptionsView: View {
    @Bindable var viewModel: EventsViewModel
    
    private func bindingForCategory(index: Int) -> Binding<Bool> {
        Binding(
            get: { viewModel.selectedIndexCategory == index },
            set: { newValue in
                if newValue {
                    viewModel.selectedIndexCategory = index
                }
            }
        )
    }
    
    var body: some View {
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
                            ForEach(0..<viewModel.categories.count, id: \.self) { index in
                                HStack {
                                    Text(viewModel.categories[index])
                                        .padding(.leading, 20)
                                    Spacer()
                                    Toggle("", isOn: bindingForCategory(index: index))
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
    }
}

struct CategoryPreviewWrapper: View {
    @State private var viewModel = EventsViewModel()
    
    var body: some View {
        CategoryOptionsView(viewModel: viewModel)
    }
}

#Preview {
    CategoryPreviewWrapper()
}
