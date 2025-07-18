//
//  ForumView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct ForumView: View {
    
    func header() -> some View {
        HStack {
            Text("Forum")
                .font(.custom("Safiro-SemiBold", size: 36))
            Spacer()
            ZStack {
                Circle()
                    .fill(Color.neonGreen)
                    .frame(width:44, height:44)
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.black)
            }
            ZStack {
                Circle()
                    .fill(Color.neonGreen)
                    .frame(width:44, height:44)
                Image(systemName: "plus")
                    .foregroundColor(.black)
            }
        }
    }
    
    func latest() -> some View {
        VStack {
            HStack {
                Text("Latest")
                    .font(.custom("Safiro-SemiBold", size: 22))
                Spacer()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 15) {
                        header()
                        latest()
                        ForumCard()
                        ForumCard()
                    }
                    .padding()
                }
            }
            .navigationTitle("Forum")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ForumView()
}
