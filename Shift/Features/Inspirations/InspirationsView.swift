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
                    ForEach(viewModel.women) { woman in
                        NavigationLink(destination: InspirationDetailView(woman: woman)) {
                            InspirationCard(woman: woman)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .background(Color("Violet").edgesIgnoringSafeArea(.all))            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Timeline")
                        .font(.custom("Safiro-SemiBold", size: 34))
                        .foregroundColor(.white)
                        .padding(.top, 72)
                        .padding(.bottom, 14)
                }
            }
        }
    }
}
    
    #Preview {
        InspirationsView()
    }

