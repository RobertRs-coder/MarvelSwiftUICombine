//
//  ComicModel.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 15/11/22.
//

import Foundation


// MARK: - ComicDataWrapper
struct ComicDataWrapper: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: ComicDataContainer
}

// MARK: - ComicDataContainer
struct ComicDataContainer: Codable {
    let offset, limit, total, count: Int
    let results: [Comic]
}

// MARK: - Comic
struct Comic: Codable, Identifiable{
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let resourceURI: String
}
