//
//  OnboardingStep3.swift
//  Shift
//
//  Created by Samara Lima da Silva on 28/07/2025.
//

import SwiftUI

struct OnboardingStep3: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    @Environment(UserModel.self) var userModel

    @State private var name: String = ""
    @State private var selectedInterests: Set<FieldOfInterest> = []
    
    let fields: [FieldOfInterest] = [
        FieldOfInterest(name: "Web / Mobile", nameShort: "Web", icon: .devices),
        FieldOfInterest(name: "UX / UI", nameShort: "UXUI", icon: .bezierCurve),
        FieldOfInterest(name: "Data Science & AI", nameShort: "Data", icon: .chartBar),
        FieldOfInterest(name: "Cyber Security", nameShort: "Cyber", icon: .shieldCheck),
        FieldOfInterest(name: "DevOps", nameShort: "DevOps", icon: .gear)
    ]
    
    var body: some View {
        
        let user : User = userModel.getCurrentUser()
        
            VStack() {
                Text("A little about you")
                    .font(.custom("Safiro-SemiBold", size: 32))
                    .foregroundColor(.blanc)
                    .padding(.top, 60)
                    .padding(.bottom, 39)
                
                //MARK: - Name text field
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.custom("Safiro-Medium", size: 24))
                        .foregroundColor(.blanc)
                        .multilineTextAlignment(.leading)
                    
                    TextField("Your name", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                }
                
                //MARK: - Interests selection
                VStack(alignment: .leading, spacing: 10) {
                    Text("Field of Interest")
                        .font(.custom("Safiro-Medium", size: 24))
                        .foregroundColor(.blanc)
                    
                    ForEach(fields, id: \.id) { field in
                        Button(action: {
                            if selectedInterests.contains(field) {
                                selectedInterests.remove(field)
                            } else {
                                selectedInterests.insert(field)
                            }
                        }) {
                            HStack {
                                Image(field.icon)
                                    .renderingMode(.template)
                                    .foregroundColor(selectedInterests.contains(field) ? .violet : .blanc)
                                
                                Text(field.name)
                                    .font(.custom("HelveticaNeue-Bold", size: 16))
                                    .foregroundColor(selectedInterests.contains(field) ? .violet : .blanc)
                                Spacer()
                            }
                            .padding()
                            .background(selectedInterests.contains(field) ? Color("NeonGreen") : Color.clear)
                            .cornerRadius(10)
                        }
                    }
                }
                
                Spacer()
                
                //MARK: -  Button
                Button(action: {
                    userModel.setCurrentUser(name: name.isEmpty ? "Anonymous" : name, nickname: name.isEmpty ? "Anonymous" : name, picture: user.picture, city: user.city, interests: Array(selectedInterests))
                    hasCompletedOnboarding = true

                }) {
                    Text("Let's go!")
                        .font(.custom("HelveticaNeue-Bold", size: 20))
                        .foregroundColor(.violet)
                        .frame(width: 183, height: 56)
                        .background(Color("NeonGreen"))
                        .cornerRadius(20)
                        .padding(.bottom, 40)
                }
                
              
            }
            .padding(.horizontal, 30)
            .background(Image(.background))
            .background(Color(.violet))
            .navigationBarBackButtonHidden(true)
        }
    }


#Preview {
    OnboardingStep3().environment(UserModel())
}
