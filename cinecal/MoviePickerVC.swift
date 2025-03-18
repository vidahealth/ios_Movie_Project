//
//  MoviePickerVC.swift
//  cinecal
//
//  Created by Vir Bedi on 3/18/25.
//

import UIKit

class MoviePickerVC: UIViewController {
    private var movieCarouselVC: MovieCarouselViewController!
    private let movies = Movie.movies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        
        movieCarouselVC = MovieCarouselViewController(movies: movies)
        movieCarouselVC.delegate = self
        
        addChild(movieCarouselVC)
        view.addSubview(movieCarouselVC.view)
        
        movieCarouselVC.view.translatesAutoresizingMaskIntoConstraints = false
        movieCarouselVC.didMove(toParent: self)
        
        let middleBox = createBox(withText: "Movie Details - Show details of the selected movie here")
        let bottomBox = createBox(withText: "Book Prompt - Open calendar add view here")
        
        view.addSubview(middleBox)
        view.addSubview(bottomBox)
        
        middleBox.translatesAutoresizingMaskIntoConstraints = false
        bottomBox.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieCarouselVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieCarouselVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieCarouselVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieCarouselVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            
            middleBox.topAnchor.constraint(equalTo: movieCarouselVC.view.bottomAnchor),
            middleBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            middleBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            middleBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            
            bottomBox.topAnchor.constraint(equalTo: middleBox.bottomAnchor),
            bottomBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func createBox(withText text: String) -> UIView {
        let container = UIView()
        container.backgroundColor = UIColor.systemGray5
        
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16)
        ])
        
        return container
    }
}

extension MoviePickerVC: MovieCarouselDelegate {
    func didFocusOnMovie(_ movie: Movie) {
        // Add your logic here
    }
}
