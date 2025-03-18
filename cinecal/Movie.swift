//
//  Movie.swift
//  cinecal
//
//  Created by Vir Bedi on 3/18/25.
//

import Foundation

struct Movie {
    let title: String
    let description: String
    let runtime: Int // in minutes
    let showtime: Date
    let imageURL: URL?
    
    init(title: String, description: String, runtime: Int, showtime: Date, imageURL: String) {
        self.title = title
        self.description = description
        self.runtime = runtime
        self.showtime = showtime
        self.imageURL = URL(string: imageURL)
    }
    
    static let movies: [Movie] = [
        Movie(
            title: "Inception",
            description: "A thief who enters the dreams of others to steal their secrets gets a chance to erase his past crimes.",
            runtime: 148,
            showtime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
            imageURL: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/ljsZTbVsrQSqZgWeep2B1QiDKuh.jpg"
        ),
        Movie(
            title: "The Dark Knight",
            description: "Batman sets out to dismantle the remaining criminal organizations that plague Gotham, but faces a new challenge in the Joker.",
            runtime: 152,
            showtime: Calendar.current.date(byAdding: .hour, value: 5, to: Date())!,
            imageURL: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
        ),
        Movie(
            title: "Interstellar",
            description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
            runtime: 169,
            showtime: Calendar.current.date(byAdding: .hour, value: 8, to: Date())!,
            imageURL: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg"
        ),
        Movie(
            title: "The Matrix",
            description: "A computer hacker learns about the true nature of reality and his role in the war against its controllers.",
            runtime: 136,
            showtime: Calendar.current.date(byAdding: .hour, value: 12, to: Date())!,
            imageURL: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg"
        ),
        Movie(
            title: "The Godfather",
            description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
            runtime: 175,
            showtime: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
            imageURL: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"
        ),
        Movie(
            title: "Pulp Fiction",
            description: "The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
            runtime: 154,
            showtime: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
            imageURL: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
        ),
        Movie(
            title: "Fight Club",
            description: "An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into something much more.",
            runtime: 139,
            showtime: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
            imageURL: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg"
        ),
        Movie(
            title: "Forrest Gump",
            description: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal, and other historical events unfold through the perspective of an Alabama man with an IQ of 75.",
            runtime: 142,
            showtime: Calendar.current.date(byAdding: .day, value: 3, to: Date())!,
            imageURL: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/yE5d3BUhE8hCnkMUJOo1QDoOGNz.jpg"
        ),
        Movie(
            title: "Gladiator",
            description: "A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.",
            runtime: 155,
            showtime: Calendar.current.date(byAdding: .day, value: 4, to: Date())!,
            imageURL: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg"
        ),
        Movie(
            title: "The Shawshank Redemption",
            description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
            runtime: 142,
            showtime: Calendar.current.date(byAdding: .day, value: 5, to: Date())!,
            imageURL: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg"
        )
    ]
}


