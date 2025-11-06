//
//  BookButton.swift
//  DesignSystem
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//

import SwiftUI

public struct BookmarkButton: View {
    
    var movieTitle: String
    
    @State private var isBookmarked: Bool
    
    var action: ((Bool, String) -> Void)? = nil
    
    public init(movieTitle: String, isBookmarked: Bool = false, action: ((Bool, String) -> Void)? = nil) {
        self.movieTitle = movieTitle
        _isBookmarked = State(initialValue: isBookmarked)
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            isBookmarked.toggle()
            action?(isBookmarked, movieTitle)
        }) {
            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                .foregroundColor(isBookmarked ? Color("Dark", bundle: .module) : .secondary)
                .padding()
                .animation(.easeInOut(duration: 0.1), value: isBookmarked)
        }
        .buttonStyle(.plain)
    }
}
