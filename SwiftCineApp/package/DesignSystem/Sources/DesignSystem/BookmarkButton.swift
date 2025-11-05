//
//  BookButton.swift
//  DesignSystem
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//

import SwiftUI


struct BookmarkButton: View {
    @State private var isBookmarked = false
    var action: ((Bool) -> Void)? = nil
    
    var body: some View {
        Button(action: {
            isBookmarked.toggle()
            action?(isBookmarked)
        }) {
            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                .foregroundColor(isBookmarked ? Color("Dark", bundle: .module) : .secondary)
                .padding()
                .animation(.easeInOut(duration: 0.1), value: isBookmarked)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    BookmarkButton { newValue in
        print("Bookmarked:", newValue)
    }
}
