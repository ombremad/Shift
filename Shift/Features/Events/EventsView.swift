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

                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 16)

                    TextField("Search", text: $searchEvent)
                        .padding(.leading, 50)
                        .frame(width: 316, height: 40)
                }

                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.gray)
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
