//
//  Untitled.swift
//  SwiftCineApp
//
//  Created by LORSOLD PRADON Alyssia on 06/11/2025.
//
import SwiftUI
import DesignSystem

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                if let featuredMovie = viewModel.movies.first {
                    NavigationLink(destination: MovieView(movieTitle: featuredMovie.title)) {
                        ZStack(alignment: .bottomLeading) {
                            AsyncImage(url: URL(string: featuredMovie.poster)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 250)
                                        .clipped()
                                        .cornerRadius(15)
                                } else if phase.error != nil {
                                    Rectangle()
                                        .fill(Color.red.opacity(0.3))
                                        .frame(height: 250)
                                        .cornerRadius(15)
                                } else {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(height: 250)
                                        .cornerRadius(15)
                                }
                            }
                            
                            Text(featuredMovie.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                                .padding()
                        }
                        .padding(.horizontal)
                    }
                    .buttonStyle(.plain)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.movies.dropFirst(), id: \.title) { movie in
                            NavigationLink(destination: MovieView(movieTitle: movie.title)) {
                                VStack {
                                    AsyncImage(url: URL(string: movie.poster)) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150, height: 220)
                                                .clipped()
                                                .cornerRadius(10)
                                        } else if phase.error != nil {
                                            Rectangle()
                                                .fill(Color.red.opacity(0.3))
                                                .frame(width: 150, height: 220)
                                                .cornerRadius(10)
                                        } else {
                                            Rectangle()
                                                .fill(Color.gray.opacity(0.3))
                                                .frame(width: 150, height: 220)
                                                .cornerRadius(10)
                                        }
                                    }
                                    
                                    Text(movie.title)
                                        .font(.headline)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(2)
                                        .frame(width: 150)
                                        .padding(.top, 5)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            viewModel.fetchPopularMovies()
        }
    }
}

#Preview {
    FeedView()
}
