//
//  Actor.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/16/24.
//

import Foundation

struct Actor: Codable {
    var id: Int?
    var name: String?
    var birthday: String?
    var place: String?
    var profilePath: String?
    var biography: String?
    var knownFor: String?
    var movieCredits : MovieCredits?
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case birthday
        case place = "place_of_birth"
        case profilePath = "profile_path"
        case biography
        case knownFor = "known_for_department"
        case movieCredits = "movie_credits"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        birthday = try values.decodeIfPresent(String.self, forKey: .birthday)
        place = try values.decodeIfPresent(String.self, forKey: .place)
        profilePath = try values.decodeIfPresent(String.self, forKey: .profilePath)
        biography = try values.decodeIfPresent(String.self, forKey: .biography)
        knownFor = try values.decodeIfPresent(String.self, forKey: .knownFor)
        movieCredits = try values.decodeIfPresent(MovieCredits.self, forKey: .movieCredits)
    }
}

struct MovieCredits: Codable {
    var movies: [Movie]?
    enum CodingKeys: String, CodingKey {
        case movies = "cast"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        movies = try values.decodeIfPresent([Movie].self, forKey: .movies)
    }
}
