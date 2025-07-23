//
//  InspirationsView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

        //MARK: Track Y(vertical) position of each card
struct CardOffsetKey: PreferenceKey {
    static var defaultValue: [Int: CGFloat] = [:]
    
    static func reduce(value: inout [Int: CGFloat], nextValue: () -> [Int: CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

struct InspirationsView: View {
    @StateObject private var viewModel = InspirationsViewModel()
    @State private var cardOffsets: [Int: CGFloat] = [:]
    @State private var currentOpenIndex: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    
        // MARK: Vertical Line
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(Color.white.opacity(0.4))
                            .frame(width: 3)
                            .frame(height: 3770)
                            .offset(x: 110.5, y: 150.0)
                    }
                   
                    VStack(spacing: 17) {
        // MARK: Title
                        Text("Timeline")
                            .font(.custom("Safiro-SemiBold", size: 34))
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                        
        // MARK: Cards list
                        ForEach(Array(viewModel.women.enumerated()), id: \.element.id) { index, woman in
                            GeometryReader { geo in
                                NavigationLink(destination: InspirationDetailView(women: viewModel.women, currentIndex: index)) {
                                    InspirationCard(woman: woman, isOpen: currentOpenIndex == index)
                                        .scaleEffect(currentOpenIndex == index ? 1.05 : 1.00) 
                                        .animation(.spring(response: 0.4, dampingFraction: 0.75), value: currentOpenIndex)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .background(
                                    Color.clear
                                        .preference(
                                            key: CardOffsetKey.self,
                                            value: [index: geo.frame(in: .global).midY]
                                        )
                                )
                            }
                            .frame(height: 250)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                        }
                    }
        // MARK: Detects and updates changings in the cards positions
                    .onPreferenceChange(CardOffsetKey.self) { value in
                        cardOffsets = value
                        updateCurrentOpenIndex()
                    }
                }
        // MARK: Extra space so the last card can reach the top of the screen =)
                Color.clear
                    .frame(height: 340)
            }
            .background(Image("background"))
            .background(Color("Violet"))
        }
    }
    
        //MARK: When the card reaches the top 30% of the screen isOpen = true
    private func updateCurrentOpenIndex() {
        let targetY = UIScreen.main.bounds.height * 0.30
        let closest = cardOffsets.min { abs($0.value - targetY) < abs($1.value - targetY) }
        if let newIndex = closest?.key {
            withAnimation {
                currentOpenIndex = newIndex
            }
        }
    }
}

#Preview {
    InspirationsView()
}
