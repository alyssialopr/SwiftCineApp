//
//  Card.swift
//  DesignSystem
//
//  Created by LOPES Anthony on 05/11/2025.
//

import SwiftUI

struct CustomCard<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(
                color: Color.black.opacity(0.1),
                radius: 8,
                x: 0,
                y: 4
)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.1), lineWidth: 0.5)
            )
    }
}

#Preview {
    VStack(spacing: 16) {
        CustomCard {
            VStack(alignment: .leading, spacing: 8) {
                Text("Titre de la carte")
                    .font(.headline)
                Text("Ceci est une carte de ton design system avec une ombre légère.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        
        CustomCard {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Carte avec icône")
                    .font(.body)
                Spacer()
            }
        }
    }
    .padding()
    .background(Color(.secondarySystemBackground))

}
