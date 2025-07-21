//
//  HowToFieldOfInterest.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

// This file is a simple example on how to use the Field Of Interests view model

import SwiftUI


struct HowToFieldOfInterest: View {
    @State var fieldOfInterests = fieldOfInterestModel()
    
    var body: some View {
        VStack {
            ForEach (fieldOfInterests.getFieldOfInterestList()) { fieldOfInterest in
                HStack {
                    Image(fieldOfInterest.icon)
                    Text(fieldOfInterest.name)
                }
            }
        }
        
    }
}

#Preview {
    HowToFieldOfInterest()
}
