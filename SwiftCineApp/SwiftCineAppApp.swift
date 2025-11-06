//
//  SwiftCineAppApp.swift
//  SwiftCineApp
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//

import SwiftUI
import DesignSystem

@main
struct SwiftCineAppApp: App {
    @StateObject var bookmarkManager = BookmarkManager()
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        FeedButton()
                        Text("Feed")
                    }
                
                FavoritesView()
                    .tabItem {
                        FavoriteButton()
                        Text("Favorites")
                    }
            }
            .environmentObject(bookmarkManager)
        }
    }
}
