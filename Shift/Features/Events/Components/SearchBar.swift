//
//  SearchBar.swift
//  Shift
//
//  Created by Mehdi Legoullon on 29/07/2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchEvent: String
    @Binding var showingFilterModal: Bool
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 310, height: 40)
                
                Image("magnifying-glass")
                    .frame(width: 40, height: 40)
                    .background(Color("NeonGreen"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextField("Search", text: $searchEvent)
                    .font(.custom("Helvetica Neue", size: 14))
                    .padding(.leading, 50)
                    .frame(width: 316, height: 40)
            }
            
            Button(action: {
                showingFilterModal.toggle()
            }) {
                Image("faders")
                    .frame(width: 42, height: 40)
                    .background(Color("NeonGreen"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.black)
                    .padding(.leading, -3)
            }
        }
        .padding(.leading, 25)
    }
}


// Prévisualisation pour SearchBar
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        // Utilisez un conteneur pour gérer les états locaux
        SearchBarContainer()
    }
    
    // Conteneur pour gérer les états locaux pour la prévisualisation
    struct SearchBarContainer: View {
        @State private var searchText: String = ""
        @State private var isShowingFilterModal: Bool = false
        
        var body: some View {
            SearchBar(searchEvent: $searchText, showingFilterModal: $isShowingFilterModal)
        }
    }
}
