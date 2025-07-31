//
//  ProfilView.swift
//  Shift
//
//  Created by alize on 27/07/2025.
//

import SwiftUI
import UIKit

struct ProfilView: View {
    @Environment(UserModel.self) var userModel
    var body: some View {
        VStack{
            UserProfil()
                .ignoresSafeArea()
        }
    }
}

struct UserProfil: UIViewControllerRepresentable {
    @Environment(UserModel.self) var userModel
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        vc.viewModel = userModel
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

#Preview {
    ProfilView().environment(UserModel())
}
