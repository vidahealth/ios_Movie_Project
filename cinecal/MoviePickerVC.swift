//
//  MoviePickerVC.swift
//  cinecal
//
//  Created by Vir Bedi on 3/18/25.
//

import UIKit

class MoviePickerVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        
        let topBox = createBox(withText: "Movie Carousel - Implement a carousel of movies here")
        let middleBox = createBox(withText: "Movie Details - Show details of the selected movie here")
        let bottomBox = createBox(withText: "Book Prompt - Open calendar add view here")
        
        view.addSubview(topBox)
        view.addSubview(middleBox)
        view.addSubview(bottomBox)
        
        topBox.translatesAutoresizingMaskIntoConstraints = false
        middleBox.translatesAutoresizingMaskIntoConstraints = false
        bottomBox.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            
            middleBox.topAnchor.constraint(equalTo: topBox.bottomAnchor),
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
