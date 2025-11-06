//
//  FavoriteButton.swift
//  DesignSystem
//
//  Created by LORSOLD PRADON Alyssia on 06/11/2025.
//

import SwiftUI

public struct FavoriteButton: View {
    @State private var isCliqued = false
    var action: ((Bool) -> Void)? = nil
    
    public init(action: ((Bool) -> Void)? = nil) {
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                isCliqued.toggle()
            }
            action?(isCliqued)
        }) {
            HStack {
                Image(systemName: isCliqued ? "bookmark.fill" : "bookmark")
                    .foregroundColor(isCliqued ? Color("Dark", bundle: .module) : .secondary)
                    .animation(.easeInOut(duration: 0.1), value: isCliqued)
                
                if isCliqued {
                    Text("Favorites")
                        .transition(.opacity.combined(with: .move(edge: .leading)))
                }
            }
            .padding()
        }
        .buttonStyle(.plain)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    FavoriteButton { newValue in
        print("Bookmarked:", newValue)
    }
}
