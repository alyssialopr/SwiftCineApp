//
//  ButtonPrimary.swift
//  DesignSystem
//
//  Created by LOPES Anthony on 05/11/2025.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.black)
                .cornerRadius(20)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 16) {
        CustomButton(title: "Se connecter") {
            print("Bouton appuyé")
        }
        CustomButton(title: "Continuer") {
            print("Continuer")
        }
    }
    .padding()
    .background(Color(.systemBackground))
}
