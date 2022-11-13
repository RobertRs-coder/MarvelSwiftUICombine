//
//  MarvelModels.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 13/11/22.
//

import Foundation

// MARK: - CharacterDataWrapper
struct CharacterDataWrapper: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: CharacterDataContainer
}

// MARK: - CharacterDataContainer
struct CharacterDataContainer: Codable {
    let offset, limit, total, count: Int
    let results: [Character]
}

// MARK: - Character
struct Character: Codable , Identifiable{
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let resourceURI: String
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case jpg = "jpg"
}

