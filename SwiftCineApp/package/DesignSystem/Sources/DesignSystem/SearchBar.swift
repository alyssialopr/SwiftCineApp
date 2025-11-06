//
//  Untitled.swift
//  DesignSystem
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//
import SwiftUI

public struct SearchBar: View {
    @Binding var showSearchField: Bool
    @Binding var searchText: String
    var onCommit: (() -> Void)? = nil

    public init(
        showSearchField: Binding<Bool>,
        searchText: Binding<String>,
        onCommit: (() -> Void)? = nil
    ) {
        self._showSearchField = showSearchField
        self._searchText = searchText
        self.onCommit = onCommit
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
                CustomTextField(
                    icon: nil,
                    placeholder: "Rechercher un film...",
                    text: $searchText
                )
                .onSubmit {
                    onCommit?()
                }
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(
        showSearchField: .constant(true),
        searchText: .constant("Inception")
    )
}
