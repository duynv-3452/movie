//
//  Cast.swift
//  Film
//
//  Created by Duy Nguyễn on 13/04/2024.
//

import Foundation

//struct Cast: Codable {
//    let id: Int?
//    let name: String?
//    let profiePath: String?
//    let originalName: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case profilePath = "profile_path"
//        case originalName = "original_name"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        profiePath = try values.decodeIfPresent(String.self, forKey: .profilePath)
//        originalName = try values.decodeIfPresent(String.self, forKey: .originalName)
//    }
//}

struct Cast: Codable {
    let id: Int?
    let name: String?
    let profilePath: String?
    let originalName: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case profilePath = "profile_path"
        case originalName = "original_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        profilePath = try values.decodeIfPresent(String.self, forKey: .profilePath)
        originalName = try values.decodeIfPresent(String.self, forKey: .originalName)
    }
}


