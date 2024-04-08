//
//  MovieResponse.swift
//  Film
//
//  Created by nguyen.van.duyb on 4/5/24.
//

import Foundation

struct MovieResponse: Codable {
    var results: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        results = try value.decodeIfPresent([Movie].self, forKey: .results)
    }
}
