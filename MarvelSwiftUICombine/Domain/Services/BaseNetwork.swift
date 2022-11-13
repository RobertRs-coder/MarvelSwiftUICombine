//
//  BaseNetwork.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 13/11/22.
//

import Foundation

let server = "https://gateway.marvel.com"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
}

enum endpoint: String {
    case characters = "/v1/public/characters"
}

enum parameters: String {
    case apiKey = "a1f21e3400afe5c8281d46a39d76797e"
    case hash = "87a0397bf24947260fa2bc4f823a48e2"
    case ts = "1"
}

struct BaseNetwork{
    
    func getSessionCharacters() -> URLRequest{
        //Create url with need it parameters
        var url = URL(string: "\(server)\(endpoint.characters.rawValue)?apikey=\(parameters.apiKey.rawValue)&ts=\(parameters.ts.rawValue)&hash=\(parameters.hash.rawValue)&orderBy=-modified")
        //Create request from url
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
}
