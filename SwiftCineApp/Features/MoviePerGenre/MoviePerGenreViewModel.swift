//
//  MoviePerGenreViewModel.swift
//  SwiftCineApp
//
//  Created by LORSOLD PRADON Alyssia on 06/11/2025.
//

import SwiftUI
import Foundation

class MoviePerGenreViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiKey = "cd2f67c6"
    
    private let moviesByGenre: [String: [String]] = [
        "Action": ["Inception", "The Dark Knight", "Gladiator", "The Matrix", "Ocean's Eleven", "Ocean's Thirteen",  "Ocean's Twelve"],
        "Drama":  ["Titanic", "The Shawshank Redemption", "Fight Club", "Joker", "If I Stay"],
        "Fantasy": ["Avatar", "The Lord of the Rings", "Wicked"],
        "Comedy": ["The Devil Wears Prada", "Barbie", "Pulp Fiction", "Mean Girls"],
        "Romance" : ["The Notebook", "Pride & Prejudice", "When Harry Met Sally", "The Great Gatsby"]
    ]
    
    func fetchMovies(for genre: String) {
        isLoading = true
        errorMessage = nil
        movies = []
        
        guard let titles = moviesByGenre[genre]?.shuffled().prefix(8) else {
            self.isLoading = false
            self.errorMessage = "Genre inconnu."
            return
        }
        
        let group = DispatchGroup()
        var fetchedMovies: [Movie] = []
        
        for title in titles {
            group.enter()
            
            let titleEncoded = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? title
            let urlString = "https://www.omdbapi.com/?t=\(titleEncoded)&apikey=\(apiKey)"
            
            guard let url = URL(string: urlString) else {
                group.leave()
                continue
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                defer { group.leave() }
                
                if let error = error {
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let movie = try JSONDecoder().decode(Movie.self, from: data)
                    DispatchQueue.main.async {
                        fetchedMovies.append(movie)
                    }
                } catch {
                    print("❌ Erreur de décodage pour \(title): \(error.localizedDescription)")
                }
            }.resume()
        }
        
        group.notify(queue: .main) {
            self.isLoading = false
            self.movies = fetchedMovies
            if fetchedMovies.isEmpty {
                self.errorMessage = "Aucun film n’a pu être chargé pour ce genre."
            }
        }
    }
}
