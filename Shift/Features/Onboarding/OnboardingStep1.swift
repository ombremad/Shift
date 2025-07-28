//
//  OnboardingStep1.swift
//  Shift
//
//  Created by Samara Lima da Silva on 28/07/2025.
//

import SwiftUI

struct OnboardingStep1: View {
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 40) {
                Spacer()
                
                Text("Welcome to")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Text("SHIFT")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("A space for women in tech to connect,\ngrow, and inspire each other.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                NavigationLink(destination: OnboardingStep2()) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("NeonGreen"))
                        .foregroundColor(.black)
                        .cornerRadius(30)
                        .padding(.horizontal, 40)
                }
                
                Spacer()
            }
            .background(Image("background"))
            .background(Color("Violet"))

        }


       

    }
}

#Preview {
    OnboardingStep1()
}
