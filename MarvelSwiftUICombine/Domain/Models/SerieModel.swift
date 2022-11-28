//
//  SerieModel.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 28/11/22.
//

import Foundation

// MARK: - SerieDataWrapper
struct SerieDataWrapper: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: SerieDataContainer
}

// MARK: - SerieDataContainer
struct SerieDataContainer: Codable {
    let offset, limit, total, count: Int
    let results: [Serie]
}

// MARK: - Comic
struct Serie: Codable, Identifiable{
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let resourceURI: String
}
