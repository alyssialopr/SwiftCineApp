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
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.movies, id: \.title) { movie in
                        VStack {
                            AsyncImage(url: URL(string: movie.poster)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 220)
                                    .clipped()
                                    .cornerRadius(10)
                            } placeholder: {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 150, height: 220)
                                    .cornerRadius(10)
                            }
                            
                            Text(movie.title)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                .frame(width: 150)
                                .padding(.top, 5)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("🎬 Feed des Films")
        }
        .onAppear {
            viewModel.fetchPopularMovies()
        }
    }
}

#Preview {
    FeedView()
}

