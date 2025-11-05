//
//  Untitled.swift
//  DesignSystem
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//
import SwiftUI

public struct SearchBar: View {
    @State private var showSearchField = false
    @State private var searchText = ""
    
    public init(showSearchField: Bool = false, searchText: String = "") {
        self.showSearchField = showSearchField
        self.searchText = searchText
    }

    public var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.2)) {
                    showSearchField.toggle()
                }
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                    .imageScale(.large)
            }

            if showSearchField {
                CustomTextField(icon: nil, placeholder: "Rechercher...", text: $searchText)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar()
}
