//
//  ProfilView.swift
//  Shift
//
//  Created by alize on 27/07/2025.
//

import SwiftUI
import UIKit

struct ProfilView: View {
    var body: some View {
        VStack{
            UserProfil()
                .ignoresSafeArea()
        }
    }
}

struct UserProfil: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

#Preview {
    ProfilView()
}
