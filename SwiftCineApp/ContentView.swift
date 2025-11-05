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

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                SearchBar(showSearchField: showSearchField, searchText: searchText)
                
                NavigationLink("Aller aux détails") {
                    ContentView()
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Movie Cine App")
        }
    }
}

#Preview {
    ContentView()
}

