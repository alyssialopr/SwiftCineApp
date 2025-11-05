//
//  MovieModel.swift
//  SwiftCineApp
//
//  Created by LOPES Anthony on 05/11/2025.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let year: String
    let rated: String
    let released: String
    let runtime: String
    let genre: String
    let actors: String
    let plot: String
    let poster: String
    let imdbRating: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating
    }
}
