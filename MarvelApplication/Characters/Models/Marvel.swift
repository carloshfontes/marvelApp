//
//  Marvel.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation


struct Marvel: Codable {
    let data: MarvelData
    let count: Int?
    let copyright: String?
}

struct MarvelData: Codable {
    let results: [Character]
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
}

public struct Character: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
