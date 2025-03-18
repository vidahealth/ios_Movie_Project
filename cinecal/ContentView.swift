//
//  ContentView.swift
//  cinecal
//
//  Created by Vir Bedi on 3/18/25.
//

import SwiftUI

struct MovieCarouselView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MoviePickerVC {
        return MoviePickerVC()
    }
    
    func updateUIViewController(_ uiViewController: MoviePickerVC, context: Context) {
        // Ignore - Make all updates in VC
    }
}

struct ContentView: View {
    @State private var showMovieCarousel = false
    
    var body: some View {
        VStack {
            Button("Show Movie Carousel") {
                showMovieCarousel = true
            }
            .fullScreenCover(isPresented: $showMovieCarousel) {
                MovieCarouselView()
            }
        }
    }
}

#Preview {
    ContentView()
}
