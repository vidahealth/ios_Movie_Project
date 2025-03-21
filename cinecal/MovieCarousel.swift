//
//  MovieCarousel.swift
//  cinecal
//
//  Created by Vir Bedi on 3/18/25.
//

import UIKit

protocol MovieCarouselDelegate: AnyObject {
    func didFocusOnMovie(_ movie: Movie)
}

class MovieCarouselViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var movies: [Movie]
    private var collectionView: UICollectionView!
    weak var delegate: MovieCarouselDelegate?
    
    init(movies: [Movie]) {
        self.movies = movies
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: view.bounds.width * 0.7, height: view.bounds.height * 0.9)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        findFocusedMovie()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            findFocusedMovie()
        }
    }
    
    private func findFocusedMovie() {
        let centerPoint = view.convert(view.center, to: collectionView)
        if let indexPath = collectionView.indexPathForItem(at: centerPoint) {
            let focusedMovie = movies[indexPath.item]
            delegate?.didFocusOnMovie(focusedMovie)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.configure(with: movies[indexPath.item])
        return cell
    }
}

class MovieCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private static let imageCache = NSCache<NSURL, UIImage>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil // Prevents image duplication
    }
    
    private func setupView() {
        contentView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with movie: Movie) {
        if let url = movie.imageURL {
            loadImage(from: url)
        }
    }
    
    private func loadImage(from url: URL) {
        if let cachedImage = MovieCell.imageCache.object(forKey: url as NSURL) {
            imageView.image = cachedImage
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, let image = UIImage(data: data) else { return }
            
            // Cache the image
            MovieCell.imageCache.setObject(image, forKey: url as NSURL)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        task.resume()
    }
}
