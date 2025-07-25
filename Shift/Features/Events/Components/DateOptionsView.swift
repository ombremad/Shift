//
//  DateOptionsView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 25/07/2025.
//

import SwiftUI

struct DateOptionsView: View {
    @Bindable var viewModel: EventsViewModel

    private func bindingForOption(index: Int) -> Binding<Bool> {
        Binding(
            get: { viewModel.selectedIndexOption == index },
            set: { newValue in
                if newValue {
                    viewModel.selectedIndexOption = index
                }
            }
        )
    }

    var body: some View {
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
                            ForEach(0..<viewModel.options.count, id: \.self) {
                                index in
                                HStack {
                                    Text(viewModel.options[index])
                                        .padding(.leading, 20)
                                    Spacer()
                                    Toggle(
                                        "",
                                        isOn: bindingForOption(index: index)
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
    }
}

struct PreviewWrapper: View {
    @State private var viewModel = EventsViewModel()

    var body: some View {
        DateOptionsView(viewModel: viewModel)
    }
}

#Preview {
    PreviewWrapper()
}
