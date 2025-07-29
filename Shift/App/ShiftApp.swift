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
    
    init() {
#if DEBUG
        UserDefaults.standard.removeObject(forKey: "hasCompletedOnboarding")
#endif
    }
    
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                TabBarView()
            } else {
                OnboardingStep1()
            }
        }
    }
}

#Preview{
    TabBarView()
}
