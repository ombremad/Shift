//
//  OnboardingStep2.swift
//  Shift
//
//  Created by Samara Lima da Silva on 28/07/2025.
//

import SwiftUI

        struct OnboardingStep2: View {
            var body: some View {
                
                NavigationStack {
                    VStack() {
                        
                        Text("Why SHIFT?")
                            .font(.custom("Safiro-SemiBold", size: 36))
                            .foregroundColor(.blanc)
                            .padding(.top, 60)
                            .padding(.bottom, 70)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(.neonGreen))
                                        .frame(width: 55, height: 55)
                                    Image("eye")}
                                Text("Discover inspiring women in tech")
                                    .padding(.leading, 15)
                            }
                            .padding(.bottom, 40)
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(.neonGreen))
                                        .frame(width: 55, height: 55)
                                    Image("pencil-line")}
                                Text("Share your thoughts and stories in the forum")
                                    .padding(.leading, 15)
                            }
                            .padding(.bottom, 40)
                            
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(.neonGreen))
                                        .frame(width: 55, height: 55)
                                    Image("calendar-star")}
                                Text("Explore upcoming events and meetups")
                                    .padding(.leading, 15)
                                
                            }
                            .padding(.bottom, 40)
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color(.neonGreen))
                                        .frame(width: 55, height: 55)
                                    Image("smiley")
                                }
                                Text("Find your daily boost of motivation")
                                    .padding(.leading, 15)
                                
                            }
                        }
                        .padding(.horizontal, 50)
                        .foregroundColor(.blanc)
                        .font(.custom("Safiro-Medium", size: 20))
                        
                        Spacer()
                        
                        NavigationLink(destination: OnboardingStep3()) {
                            Text("Next")
                                .font(.custom("HelveticaNeue-Bold", size: 20))
                                .foregroundColor(.violet)
                                .frame(width: 183, height: 56)
                                .background(Color("NeonGreen"))
                                .cornerRadius(20)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 40)
                        
                    }
                    .background(Image(.background))
                    .background(Color(.violet))
                    .navigationBarBackButtonHidden(true)
                }
                }
            }
        


    

#Preview {
    OnboardingStep2()
}
