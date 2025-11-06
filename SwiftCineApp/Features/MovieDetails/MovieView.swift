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
    @EnvironmentObject var bookmarkManager: BookmarkManager
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                
                if let movie = viewModel.movie {
                    AsyncImage(url: URL(string: movie.poster)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width,
                                   height: 500)
                            .clipped()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                            .frame(height: 500)
                    }
                } else {
                    Color.black.opacity(0.05)
                        .frame(height: 500)
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        
                        Spacer().frame(height: 400)
                        
                        if viewModel.isLoading {
                            ProgressView("Chargement...")
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .scaleEffect(1.5)
                                .padding(.top, 100)
                        } else if let movie = viewModel.movie {
                            VStack(alignment: .leading, spacing: 46) {
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(movie.title)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                    
                                    HStack(spacing: 10) {
                                        Text(movie.runtime)
                                        Text("•")
                                        Text(movie.released)
                                        BookmarkButton(
                                            movieTitle: movie.title,
                                            isBookmarked: bookmarkManager.isBookmarked(title: movie.title)
                                        ) { isMarked, title in
                                            bookmarkManager.toggleBookmark(title: title, isBookmarked: isMarked)
                                        }
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    
                                    
                                }
                                
                                Divider()
                                
                                VStack(alignment: .leading, spacing: 26) {
                                    HStack {
                                        Score(score: Double(movie.imdbRating) ?? 0)
                                        Text(movie.genre)
                                            .font(.headline)
                                    }
                                    
                                    Text("Acteurs : \(movie.actors)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    Text(movie.plot)
                                        .font(.body)
                                        .padding(.top, 8)
                                }
                            }
                            .padding(24)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(Color(.systemBackground))
                            )
                        } else {
                            Text("Aucune donnée pour ce film.")
                                .foregroundColor(.gray)
                                .padding(.top, 120)
                        }
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationTitle(movieTitle)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.fetchMovie(title: movieTitle)
            }
        }
    }
}

#Preview {
    MovieView(movieTitle: "B")
}
