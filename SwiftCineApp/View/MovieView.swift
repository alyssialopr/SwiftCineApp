//
//  MovieView.swift
//  SwiftCineApp
//
//  Created by LOPES Anthony on 05/11/2025.
//


import SwiftUI

struct MovieView: View {
    @StateObject private var viewModel = MovieViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Champ de recherche
                HStack {
                    TextField("Titre du film", text: $searchText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(radius: 1)
                        .padding(.leading)
                    
                    Button(action: {
                        viewModel.fetchMovie(title: searchText)
                        hideKeyboard()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                    }
                    .padding(.trailing)
                }
                .padding(.top)
                
                Spacer()
                
                if viewModel.isLoading {
                    ProgressView("Chargement...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(1.5)
                } else if let movie = viewModel.movie {
                    ScrollView {
                        GeometryReader { geometry in
                            if geometry.frame(in: .global).minY <= 0 {
                                AsyncImage(url: URL(string: movie.poster)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width, height: 400)
                                        .clipped()
                                } placeholder: {
                                    Color.gray.opacity(0.3)
                                        .frame(height: 400)
                                }
                            } else {
                                AsyncImage(url: URL(string: movie.poster)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .offset(y: -geometry.frame(in: .global).minY)
                                        .frame(width: UIScreen.main.bounds.width, height: 400 + geometry.frame(in: .global).minY)
                                        .clipped()
                                } placeholder: {
                                    Color.gray.opacity(0.3)
                                        .frame(height: 400)
                                }
                            }
                        }
                        .frame(height: 400)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            // Infos principales au-dessus du poster
                            VStack(alignment: .leading, spacing: 4) {
                                Text(movie.title)
                                    .font(.title)
                                    .bold()
                                
                                HStack(spacing: 10) {
                                    Text(movie.runtime)
                                    Text(movie.released)
                                }
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            }
                            .padding(.horizontal)
                            .padding(.top, -100) // remonte sur le poster
                            
                            Divider()
                            
                            // Synopsis et détails
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("⭐️ \(movie.imdbRating)/10")
                                    Text(movie.genre)
                                }
                                .font(.headline)
                                
                                Text("Acteurs: \(movie.actors)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                Text(movie.plot)
                                    .font(.body)
                                    .padding(.top, 4)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 30)
                        }
                    }
                    .edgesIgnoringSafeArea(.top)
                } else if let error = viewModel.errorMessage {
                    Text("Erreur: \(error)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    Text("Recherchez un film pour voir ses informations")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                Spacer()
            }
            .navigationTitle("Recherche OMDb")
        }
    }
}

// Extension pratique pour cacher le clavier
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

