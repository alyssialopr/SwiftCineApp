//
//  ContentView.swift
//  SwiftCineApp
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//
	
import SwiftUI
import DesignSystem

struct ContentView: View {
    @State private var showSearchField = false
    @State private var searchText = ""
    @State private var navigateToMovie = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                SearchBar(
                    showSearchField: $showSearchField,
                    searchText: $searchText
                ) {
                    if !searchText.isEmpty {
                        navigateToMovie = true
                    }
                }
                .padding(.top)
                
                Spacer()
                
                Text("Bienvenue dans Movie Cine App 🎬")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .navigationDestination(isPresented: $navigateToMovie) {
                MovieView(movieTitle: searchText)
            }
            .navigationTitle("Movie Cine App")
        }
    }
}

#Preview {
    ContentView()
}

