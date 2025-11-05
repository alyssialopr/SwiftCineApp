//
//  FeedButton.swift
//  DesignSystem
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//


import SwiftUI

<<<<<<< HEAD

struct FeedButton: View {
    @State private var isBookmarked = false
=======
struct FeedButton: View {
    @State private var isCliqued = false
>>>>>>> 120479c845b6e16073eb41777cffb1fedde2ab93
    var action: ((Bool) -> Void)? = nil
    
    var body: some View {
        Button(action: {
<<<<<<< HEAD
            isBookmarked.toggle()
            action?(isBookmarked)
        }) {
            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                .foregroundColor(isBookmarked ? Color("Dark") : .secondary)
                .padding()
                .animation(.easeInOut(duration: 0.1), value: isBookmarked)
        }
        .buttonStyle(.plain)
=======
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
>>>>>>> 120479c845b6e16073eb41777cffb1fedde2ab93
    }
}

#Preview {
    FeedButton { newValue in
        print("Bookmarked:", newValue)
    }
}
