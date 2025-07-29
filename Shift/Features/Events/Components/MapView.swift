//
//  MapView.swift
//  Shift
//
//  Created by Mehdi Legoullon on 28/07/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region: MKCoordinateRegion
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self._region = State(initialValue: MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }
    
    var body: some View {
        Map(position: .constant(.region(region))) {
            Annotation("", coordinate: coordinate) {
                Image(systemName: "mappin")
                    .foregroundColor(.red)
            }
        }
        .frame(width: 372, height: 217)
        .cornerRadius(9)
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522))
}
