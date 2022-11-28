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
    case series = "/series"
    case comics = "/comics"
}

enum parameters: String {
    case apiKey = "a1f21e3400afe5c8281d46a39d76797e"
    case hash = "87a0397bf24947260fa2bc4f823a48e2"
    case ts = "1"
}

struct BaseNetwork{
    
    func getSessionHeroes() -> URLRequest{
        //Create url with need it parameters
        let url = URL(string: "\(server)\(endpoint.characters.rawValue)?apikey=\(parameters.apiKey.rawValue)&ts=\(parameters.ts.rawValue)&hash=\(parameters.hash.rawValue)&orderBy=-modified")
        //Create request from url
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
//    func getSessionHeroSeries(heroId: Int) -> URLRequest{
//        //Create url with need it parameters
//        let url = URL(string: "\(server)\(endpoint.characters.rawValue)/\(heroId)\(endpoint.series.rawValue)?apikey=\(parameters.apiKey.rawValue)&ts=\(parameters.ts.rawValue)&hash=\(parameters.hash.rawValue)&orderBy=-modified")
//        //Create request from url
//        var request = URLRequest(url: url!)
//        request.httpMethod = HTTPMethods.get
//
//        return request
//    }
    
    func getSessionHeroComics(heroId: Int) -> URLRequest{
        //Create url with need it parameters
        let url = URL(string: "\(server)\(endpoint.characters.rawValue)/\(heroId)\(endpoint.comics.rawValue)?apikey=\(parameters.apiKey.rawValue)&ts=\(parameters.ts.rawValue)&hash=\(parameters.hash.rawValue)&orderBy=-modified")
        //Create request from url
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
}
