//
//  ContentView.swift
//  SwiftCineApp
//
//  Created by LORSOLD PRADON Alyssia on 05/11/2025.
//
	
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Aller aux détails") {
                MovieView()
            }
            .navigationTitle("Movie Cine App")
        }
    }
}

#Preview {
    ContentView()
}
