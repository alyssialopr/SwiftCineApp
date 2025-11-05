//
//  MovieViewModel.swift
//  SwiftCineApp
//
//  Created by LOPES Anthony on 05/11/2025.
//


import Foundation
import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiKey = "cd2f67c6"
    
    func fetchMovie(title: String) {
        guard !title.isEmpty else { return }
        
        isLoading = true
        errorMessage = nil
        movie = nil
        
        let titleEncoded = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? title
        let urlString = "https://www.omdbapi.com/?t=\(titleEncoded)&apikey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            self.errorMessage = "URL invalide"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let data = data else {
                    self.errorMessage = "Données introuvables"
                    return
                }
                
                do {
                    let movie = try JSONDecoder().decode(Movie.self, from: data)
                    self.movie = movie
                } catch {
                    self.errorMessage = "Erreur de décodage: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
