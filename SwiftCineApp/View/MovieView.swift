//
//  MovieView.swift
//  SwiftCineApp
//
//  Created by LOPES Anthony on 05/11/2025.
//


import SwiftUI
import DesignSystem

struct MovieView: View {
    let movieTitle: String
    @StateObject private var viewModel = MovieViewModel()
    
    var body: some View {
        VStack {
           if viewModel.isLoading {
               ProgressView("Chargement...")
                   .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                   .scaleEffect(1.5)
           } else if let movie = viewModel.movie {
                ScrollView {
                    VStack(spacing: 20) {
                        // 🎞 Poster du film
                        AsyncImage(url: URL(string: movie.poster)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 300)
                                .clipped()
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        } placeholder: {
                            Color.gray.opacity(0.3)
                                .frame(height: 300)
                                .cornerRadius(20)
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        // 🧾 Informations détaillées
                        VStack(alignment: .leading, spacing: 10) {
                            Text(movie.title)
                                .font(.title)
                                .bold()
                            
                            HStack {
                                Text(movie.runtime)
                                Text("•")
                                Text(movie.released)
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            
                            HStack {
                                Score(score: Double(movie.imdbRating) ?? 0)
                                Text(movie.genre)
                            }
                            .font(.headline)
                            
                            Text("Acteurs : \(movie.actors)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text(movie.plot)
                                .font(.body)
                                .padding(.top, 8)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                        .padding(.bottom, 50)
                    }
                }
                .scrollIndicators(.hidden)
                   } else if let error = viewModel.errorMessage {
                           Text("Erreur: \(error)")
                               .foregroundColor(.red)
                               .padding()
                       } else {
                           Text("Aucune donnée pour ce film.")
                               .foregroundColor(.gray)
                               .padding()
                       }
                   }
                   .onAppear {
                       viewModel.fetchMovie(title: movieTitle)
                   }
                   .navigationTitle(movieTitle)
                   .navigationBarTitleDisplayMode(.inline)
    }
}
