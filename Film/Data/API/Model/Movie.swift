//
//  Movie.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import Foundation

struct Movie: Codable {
    var id: Int?
    var title: String?
    var poster: String?
    var backDropPath: String?
    var releaseDate: String?
    var overview: String?
    var runtime: Int?
    var voteAverage: Double?
    var credits: Credits?
    var similar: MovieResponse?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
        case backDropPath = "backdrop_path"
        case releaseDate = "release_date"
        case overview
        case runtime
        case voteAverage = "vote_average"
        case credits
        case similar
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        id = try value.decodeIfPresent(Int.self, forKey: .id)
        title = try value.decodeIfPresent(String.self, forKey: .title)
        poster = try value.decodeIfPresent(String.self, forKey: .poster)
        backDropPath = try value.decodeIfPresent(String.self, forKey: .backDropPath)
        releaseDate = try value.decodeIfPresent(String.self, forKey: .releaseDate)
        overview = try value.decodeIfPresent(String.self, forKey: .overview)
        runtime = try value.decodeIfPresent(Int.self, forKey: .runtime)
        voteAverage = try value.decodeIfPresent(Double.self, forKey: .voteAverage)
        credits = try value.decodeIfPresent(Credits.self, forKey: .credits)
        similar = try value.decodeIfPresent(MovieResponse.self, forKey: .similar)
    }
    
    init() {
        id = nil
        title = nil
        poster = nil
        backDropPath = nil
        releaseDate = nil
        overview = nil
        runtime = nil
        voteAverage = nil
    }
}
