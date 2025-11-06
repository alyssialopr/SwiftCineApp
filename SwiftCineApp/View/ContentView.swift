import SwiftUI
import DesignSystem

struct ContentView: View {
    @State private var showSearchField = true
    @State private var searchText = ""
    @State private var navigateToMovie = false
    
    private let allGenres = ["Action", "Drama", "Fantasy", "Comedy"]
    @State private var selectedGenres: [String] = []
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    SearchBar(
                        showSearchField: $showSearchField,
                        searchText: $searchText
                    ) {
                        if !searchText.isEmpty {
                            navigateToMovie = true
                        }
                    }
                    .padding(.top)
                    
                    FeedView()
                    
                    ForEach(selectedGenres, id: \.self) { genre in
                        MoviePerGenreView(genre: genre)
                    }
                }
            }
            .onAppear {
                selectRandomGenres()
            }
            .navigationDestination(isPresented: $navigateToMovie) {
                MovieView(movieTitle: searchText)
            }
            .navigationTitle("Movie Cine App")
        }
        
    }
    
    private func selectRandomGenres() {
        selectedGenres = Array(allGenres.shuffled().prefix(2))
    }
}

#Preview {
    ContentView()
}
