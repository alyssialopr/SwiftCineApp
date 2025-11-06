//
//  TextField.swift
//  DesignSystem
//
//  Created by LOPES Anthony on 05/11/2025.
//

import SwiftUI

struct CustomTextField: View {
    var icon: String? = nil
    var placeholder: String
    @Binding var text: String
    var onCommit: (() -> Void)? = nil  
    
    var body: some View {
        HStack(spacing: 8) {
            if let icon = icon {
                Image(systemName: icon)
                    .foregroundColor(.gray)
            }
            
            TextField(placeholder, text: $text)
                .textFieldStyle(.plain)
                .foregroundColor(.primary)
                .onSubmit {
                    onCommit?()
                }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    VStack(spacing: 16) {
        CustomTextField(icon: "person", placeholder: "Nom d’utilisateur", text: .constant(""))
    }
    .padding()
}
