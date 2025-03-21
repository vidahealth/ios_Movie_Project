# Welcome to CineCal - The movie app with only 10 movies.

## Overview
- CineCal is a simple movie booking application that displays a carousel of movies.
- The list of movies is hardcoded in `Movies.swift` (No network calls required)
- Your task is to complete the movie details view and booking functionality in `MoviePickerVC`.

## Project Structure
- The app uses UIKit with a SwiftUI wrapper for the main view. (Gives you a live preview in `ContentView`)
- `MoviePickerVC` contains three main sections:
  1. Top: Movie carousel (already implemented)
  2. Middle: Movie details section (to be implemented)
  3. Bottom: Booking section (to be implemented)

## Tasks

1. Movie Details Implementation
   - The `MovieCarouselDelegate` will provide you with the currently selected movie
   - In the middle section, display:
     - Movie title
     - Runtime (in "X hr Y min" format)
     - Showtime (Display in readable format)
     - Movie description
   - Make the layout visually appealing and easy to read

2. Booking Implementation
   - Add a "Book Ticket" button in the bottom section
   - When tapped, present the system calendar interface
   - Create a calendar event that includes:
     - The movie's title
     - Correct start time and duration
     - Movie description in the notes

3. Any Finishing Touches
   - If time permits, add any improvements you think make the app better!

## Tips
- Check `Movie.swift` for the available movie data structure and access to demo data
