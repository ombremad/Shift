//
//  InspirationsViewModel.swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import Foundation

class InspirationsViewModel: ObservableObject { //ObservableObject: Makes the ViewModel “watchable” by views
    @Published var women: [Inspirations] = []   //@Published: Notifies the view when women is updated → triggers UI refresh
    
    init() {
        loadJSON()                              //Automatically loads the data when the ViewModel is created.
    }
    
    func loadJSON() {
        guard let url = Bundle.main.url(forResource: "inspirational_women", withExtension: "json") else {
            print("Failed to find data.json in bundle")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedWomen = try JSONDecoder().decode([Inspirations].self, from: data)
            DispatchQueue.main.async {
                self.women = decodedWomen
            }
        } catch {
            print("Failed to load or decode JSON: \(error.localizedDescription)")
        }
    }
}
