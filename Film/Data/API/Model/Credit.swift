//
//  Credit.swift
//  Film
//
//  Created by Duy Nguyễn on 13/04/2024.
//

import Foundation

struct Credits: Codable {
    var id: Int?
    var cast: [Cast]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case cast
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        cast = try values.decodeIfPresent([Cast].self, forKey: .cast)
        
    }
}
