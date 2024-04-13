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
    var runtime: String?
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
        case backDropPath = "backdrop_path"
        case releaseDate = "release_date"
        case overview
        case runtime
        case voteAverage = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        id = try value.decodeIfPresent(Int.self, forKey: .id)
        title = try value.decodeIfPresent(String.self, forKey: .title)
        poster = try value.decodeIfPresent(String.self, forKey: .poster)
        backDropPath = try value.decodeIfPresent(String.self, forKey: .backDropPath)
        releaseDate = try value.decodeIfPresent(String.self, forKey: .releaseDate)
        overview = try value.decodeIfPresent(String.self, forKey: .overview)
        runtime = try value.decodeIfPresent(String.self, forKey: .runtime)
        voteAverage = try value.decodeIfPresent(Double.self, forKey: .voteAverage)
    }
    
    init() {}
}
