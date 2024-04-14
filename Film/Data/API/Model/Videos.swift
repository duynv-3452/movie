//
//  Videos.swift
//  Film
//
//  Created by Duy Nguyễn on 14/04/2024.
//

import Foundation

struct Videos: Codable {
    var results: [Video]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        results = try values.decodeIfPresent([Video].self, forKey: .results)
    }
}

struct Video: Codable {
    var key: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case key
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        key = try values.decodeIfPresent(String.self, forKey: .key)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
