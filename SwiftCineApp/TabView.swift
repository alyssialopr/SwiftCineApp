//
//  TabView.swift
//  SwiftCineApp
//
//  Created by LORSOLD PRADON Alyssia on 06/11/2025.
//

import SwiftUI
import DesignSystem

struct NavbarSystem: View {
    var body: some View {
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
    }
}

#Preview {
    NavbarSystem()
}
