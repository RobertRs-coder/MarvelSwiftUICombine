//
//  Thumbnail.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 15/11/22.
//

import Foundation

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
    case gif = "gif"
}
