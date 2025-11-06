import SwiftUI
import DesignSystem

struct FavoritesView: View {
    @EnvironmentObject var bookmarkManager: BookmarkManager
    @State private var selectedMovie: String? = nil
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Favoris (\(bookmarkManager.bookmarkedTitles.count))")
                    .font(.headline)
                
                if bookmarkManager.bookmarkedTitles.isEmpty {
                    Text("Aucun film ajouté pour le moment.")
                        .foregroundColor(.secondary)
                } else {
                    List(bookmarkManager.bookmarkedTitles, id: \.self) { title in
                        NavigationLink(value: title) {
                            HStack {
                                Text(title)
                                Spacer()
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Mes Favoris")
            .navigationDestination(for: String.self) { title in
                MovieView(movieTitle: title)
            }
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(BookmarkManager())
}
