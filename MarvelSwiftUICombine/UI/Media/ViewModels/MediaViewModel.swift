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
    @Published var series: [Serie]?
//    @Published var comics: [Comic]?
//    @Published var comics: [Comic]?
    @Published var status = Status.none
    var heroId: Int
    
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(heroId: Int){
        self.status = .loading

        
        self.heroId = heroId
        getHeroesComics()
        getHeroesSeries()
    }
    
    //Cancel all subcribers
    func cancelAll(){
        subscriptions.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
        
    func getHeroesComics(){
//        self.status = .loading
        cancelAll()
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHeroComics(heroId: heroId))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    self.status = .error(error: "Error")
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
                case .finished:
                    print("Success")
                }
            } receiveValue: { data in
                self.comics = data.data.results
            }
            .store(in: &subscriptions)
        
            }
    
    func getHeroesSeries(){
//        self.status = .loading
        cancelAll()
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHeroSeries(heroId: heroId))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    self.status = .error(error: "Error")
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: SerieDataWrapper.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.status = Status.error(error: error.localizedDescription)
                case .finished:
                    self.status = Status.loaded
                }
            } receiveValue: { data in
                self.series = data.data.results
            }
            .store(in: &subscriptions)
        
            }
}
