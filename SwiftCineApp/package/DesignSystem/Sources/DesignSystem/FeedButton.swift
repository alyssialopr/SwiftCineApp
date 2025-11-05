//
//  FeedButton.swift
//  DesignSystem
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//


import SwiftUI

struct FeedButton: View {
    @State private var isCliqued = false
    var action: ((Bool) -> Void)? = nil
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                isCliqued.toggle()
            }
            action?(isCliqued)
        }) {
            HStack {
                Image(systemName: isCliqued ? "book.pages.fill" : "book.pages")
                    .foregroundColor(isCliqued ? Color("Dark", bundle: .module) : .secondary)
                
                if isCliqued {
                    Text("Feed")
                        .transition(.opacity.combined(with: .move(edge: .leading)))
                }
            }
        }
        .padding()
        .buttonStyle(.plain)
        .cornerRadius(10)
    }
}

#Preview {
    FeedButton { newValue in
        print("Bookmarked:", newValue)
    }
}
