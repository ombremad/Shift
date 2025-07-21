//
//  EventsView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct EventsView: View {
    
    @State private var searchEvent: String = "";
    
    @State private var selectedTab = 0;
    let tabs = ["All", "My Events", "Favorites"];
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .violet;
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected);
        UISegmentedControl.appearance().backgroundColor = .white;
    }
    
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
            
            HStack {
                Spacer()
                Picker("", selection: $selectedTab) {
                    ForEach(0 ..< tabs.count, id: \.self) { index in
                        Text(self.tabs[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 370, height: 43)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding(.top, 28)
            
            if (selectedTab == 0) {
                Text("Hello Page 1")
            } else if (selectedTab == 1) {
                Text("Hello Page 2")
            } else {
                Text("Hello Page 3")
            }
            
            
            Spacer()
        }
        .padding()
        .background(Color("Background"))
    }
}

#Preview {
    EventsView()
}
