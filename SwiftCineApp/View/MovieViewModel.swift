//
//  FeedViewModel.swift
//  SwiftCineApp
//
//  Created by LORSOLD PRADON Alyssia on 06/11/2025.
//

import SwiftUI
import Combine

class MovieViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchMovie(title: String) {
        guard let encodedTitle = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://www.omdbapi.com/?t=\(encodedTitle)&apikey=cd2f67c6") else {
            errorMessage = "Titre invalide."
            return
        }
        
        movie = nil
        errorMessage = nil
        isLoading = true
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Movie.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { movie in
                self.movie = movie
            })
            .store(in: &cancellables)
    }
}
