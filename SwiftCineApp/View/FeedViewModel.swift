//
//  FeedViewModel.swift
//  SwiftCineApp
//
//  Created by LORSOLD PRADON Alyssia on 06/11/2025.
//

import SwiftUI
import Foundation

class FeedViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiKey = "cd2f67c6"
    
    // Quelques titres de films "populaires" à tirer au hasard
    private let movieTitles = [
        "Inception",
        "Interstellar",
        "The Dark Knight",
        "Titanic",
        "The Matrix",
        "Avatar",
        "Gladiator",
        "The Shawshank Redemption",
        "Pulp Fiction",
        "The Godfather",
        "Fight Club",
        "Barbie",
        "The Lord of the Rings",
        "Wicked"
    ]
    
    func fetchPopularMovies() {
        isLoading = true
        errorMessage = nil
        movies = []
        
        // Sélectionne 5 titres aléatoires
        let randomTitles = movieTitles.shuffled().prefix(5)
        
        let group = DispatchGroup()
        var fetchedMovies: [Movie] = []
        
        for title in randomTitles {
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
                    print("❌ Erreur pour \(title): \(error.localizedDescription)")
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
                self.errorMessage = "Aucun film n’a pu être chargé."
            }
        }
    }
}
