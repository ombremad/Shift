//
//  FieldOfInterestModel.swift
//  Shift
//
//  Created by Anne Ferret on 17/07/2025.
//

import SwiftUI

@Observable
class fieldOfInterestModel {
    
    private let fieldOfInterests: [FieldOfInterest] = [
    FieldOfInterest(
        name: "Web / Mobile",
        nameShort: "Web",
        icon: .devices
    ),
    FieldOfInterest(
        name: "UX / UI",
        nameShort: "UX",
        icon: .bezierCurve
    ),
    FieldOfInterest(
        name: "Data Science",
        nameShort: "Data",
        icon: .chartBar
    ),
    FieldOfInterest(
        name: "Artificial Intelligence",
        nameShort: "AI",
        icon: .headCircuit
    ),
    FieldOfInterest(
        name: "Cyber Security",
        nameShort: "Cyber",
        icon: .shieldCheck
    ),
    FieldOfInterest(
        name: "Devops",
        nameShort: "Devops",
        icon: .gear
    )
    ]
    
    func getFieldOfInterests() -> [FieldOfInterest] {
        return fieldOfInterests
    }
}
