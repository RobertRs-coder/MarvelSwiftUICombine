//
//  HeroesView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 20/11/22.
//

import Foundation
import SwiftUI
import Combine

final class MediaViewModel: ObservableObject {
    @Published var comics: [Comic]?

    @Published var status = Status.none
//    @Published var series: [Serie]?

    @Published var hero: Hero
    
    private var subscribers = Set<AnyCancellable>()
    
    init(hero: Hero){
        self.hero = hero
        
        getHeroMedia(id: hero.id)
    }
    
    func getHeroMedia(id: Int){
        
        self.status = .loading
        
        self.getHeroComics(id: id)
//        self.getHeroSeries(id: id)

    }
    
    func getHeroComics(id:Int){
        self.status = .loading

        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHeroComics(heroId: id))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: ComicDataWrapper.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.status = Status.error(error: error.localizedDescription)
                    print("Error: \(error)")
                case .finished:
                    self.status = Status.loaded
                    print("Success")
                }
            } receiveValue: { data in
                self.comics = data.data.results
            }
            .store(in: &subscribers)
    }
    
//    func getHeroSeries(id:Int){
//        self.rootViewModel.status = .loading
//
//        URLSession.shared
//            .dataTaskPublisher(for: BaseNetwork().getSessionHeroSeries(heroId: id))
//            .tryMap{
//                guard let response = $0.response as? HTTPURLResponse,
//                      response.statusCode == 200 else {
//                    throw URLError(.badServerResponse)
//                }
//                return $0.data
//            }
//            .decode(type: ComicDataWrapper.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink { completion in
//                switch completion {
//                case .failure(let error):
//                    self.rootViewModel.status = Status.error(error: error.localizedDescription)
//                    print("Error: \(error)")
//                case .finished:
//                    self.rootViewModel.status = Status.media
//                    print("Success")
//                }
//            } receiveValue: { data in
//                self.comics = data.data.results
//            }
//            .store(in: &subscribers)
//    }
}
