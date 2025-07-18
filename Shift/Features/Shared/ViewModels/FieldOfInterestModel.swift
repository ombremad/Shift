//
//  FieldOfInterestModel.swift
//  Shift
//
//  Created by Anne Ferret on 17/07/2025.
//

import SwiftUI

@Observable
class fieldOfInterestModel {
    
    let web = FieldOfInterest(
        name: "Web / Mobile",
        nameShort: "Web",
        icon: .devices
        )
    
    let uxui = FieldOfInterest(
        name: "UX / UI",
        nameShort: "UX",
        icon: .bezierCurve
        )

    let dataScience = FieldOfInterest(
        name: "Data Science",
        nameShort: "Data",
        icon: .chartBar
        )
    
    let ai = FieldOfInterest(
        name: "Artificial Intelligence",
        nameShort: "AI",
        icon: .headCircuit
        )
    
    let cybersecurity = FieldOfInterest(
        name: "Cyber Security",
        nameShort: "Cyber",
        icon: .shieldCheck
    )
    
    let devops = FieldOfInterest(
            name: "Devops",
            nameShort: "Devops",
            icon: .gear
        )
    
    func getFieldOfInterestList() -> [FieldOfInterest] {
        return [web, uxui, dataScience, ai, cybersecurity, devops]
    }
}
