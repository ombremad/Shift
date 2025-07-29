//
//  OnboardingStep1.swift
//  Shift
//
//  Created by Samara Lima da Silva on 28/07/2025.
//

import SwiftUI

struct OnboardingStep1: View {
    @Environment(UserModel.self) var userModel

    var body: some View {
        
        NavigationStack {
            VStack(spacing: 40) {

                
                Text("Welcome to")
                    .font(.custom("Safiro-SemiBold", size: 36))
                    .foregroundColor(.blanc)
                    .padding(.top, 60)
                
                Text("SHIFT")
                    .font(.custom("Safiro-SemiBold", size: 48))
                    .foregroundColor(.blanc)
                    .padding(.top, 30)
                
                Text("A space for women\n in tech to connect, grow and inspire each other.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blanc)
                    .font(.custom("Safiro-Medium", size: 28))
                    .padding(.horizontal, 60)
                    .padding(.top, 50)
                
                Spacer()
                
                NavigationLink(destination: OnboardingStep2().environment(userModel)) {
                    Text("Next")
                        .font(.custom("HelveticaNeue-Bold", size: 20))
                        .frame(width: 183, height: 56)
                        .background(Color("NeonGreen"))
                        .cornerRadius(20)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 40)
                
    
            }
            .background(Image("background"))
            .background(Color("Violet"))
            
            

        }
    }

}

#Preview {
    OnboardingStep1().environment(UserModel())
}
