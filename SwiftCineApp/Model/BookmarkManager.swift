//
//  BookmarkManager.swift
//  SwiftCineApp
//
//  Created by LORSOLD PRADON Alyssia on 06/11/2025.
//

import Foundation


final class BookmarkManager: ObservableObject {
    
    
    @Published var bookmarkedTitles: [String] = []
    
    init() {
        
    }
    
    
    func isBookmarked(title: String) -> Bool {
        return bookmarkedTitles.contains(title)
    }
    
    
    func toggleBookmark(title: String, isBookmarked: Bool) {
        if isBookmarked {
            if !self.isBookmarked(title: title) {
                bookmarkedTitles.append(title)
            }
        } else {
            bookmarkedTitles.removeAll { $0 == title }
        }
        
    }
}
