//
//  EventsView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct EventsView: View {
    
    @State private var textInput: String = "";

    var body: some View {
        VStack(alignment: .leading) {
            Text("Events")
                .font(.custom("Safiro-Bold", size: 36))

            HStack {
                TextField("Search", text: $textInput)
                    .frame(width: 316, height: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                Spacer()
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
