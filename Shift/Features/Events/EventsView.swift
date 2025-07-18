//
//  EventsView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct EventsView: View {
    
    @State private var searchEvent: String = "";

    var body: some View {
        VStack(alignment: .leading) {
            Text("Events")
                .font(.custom("Safiro-Bold", size: 36))

            HStack {

                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 316, height: 40)

                    Image("magnifying-glass")
                        .frame(width: 40, height: 40)
                        .background(Color("NeonGreen"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    TextField("Search", text: $searchEvent)
                        .font(.custom("Helvetica Neue", size: 14))
                        .padding(.leading, 60)
                        .frame(width: 316, height: 40)
                }

                Image("faders")
                    .frame(width: 42, height: 40)
                    .background(Color("NeonGreen"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.leading, 8)
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

#Preview {
    EventsView()
}
