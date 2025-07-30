//
//  ShiftApp.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

@main
struct ShiftApp: App {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    @State var userModel = UserModel()
    
    init() {
#if DEBUG
        UserDefaults.standard.removeObject(forKey: "hasCompletedOnboarding")
#endif
    }
    
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                TabBarView().environment(userModel)
            } else {
                OnboardingStep1().environment(userModel)
            }
        }
    }
}

#Preview{
    TabBarView().environment(UserModel())
}
