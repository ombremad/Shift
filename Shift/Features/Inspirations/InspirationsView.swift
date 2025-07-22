//
//  InspirationsView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct InspirationsView: View {
    @StateObject private var viewModel = InspirationsViewModel()
        
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    ForEach(Array(viewModel.women.enumerated()), id: \.element.id) { index, woman in
                        NavigationLink(destination: InspirationDetailView(women: viewModel.women, currentIndex: index)) {
                            InspirationCard(woman: woman)
                    }
                        .buttonStyle(PlainButtonStyle())

                    }
                }
                .toolbarBackground(Color("Violet"), for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Timeline")
                            .font(.custom("Safiro-SemiBold", size: 34))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }
                }
            }
            .background(Image("background"))
            .background(Color("Violet"))
        }
    }
}

    #Preview {
        InspirationsView()
    }

