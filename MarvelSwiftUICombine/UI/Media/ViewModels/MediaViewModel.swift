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
    @Published var status = Status.none
    @Published var comics: [Comic]?
    @Published var series: [Serie]?
    
    var heroName: String
    var heroId: Int
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(heroId: Int, heroName: String){
        
        self.heroName = heroName
        self.heroId = heroId
        
        getApiData()

    }
    
    //Cancel all subcribers
    func cancelAll(){
        subscriptions.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
    
    
    func getApiData(){
        
        self.status = .loading
        
        cancelAll()
        
        self.getHeroComics()
        self.getHeroSeries()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.status = Status.loaded
        }
    }
        
    func getHeroComics(){
//        self.status = .loading
//        cancelAll()
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkManager().getSessionHeroComics(heroId: heroId))
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
//                    self.status = Status.loaded
                    print("Success")
                }
            } receiveValue: { data in
                self.comics = data.data.results
            }
            .store(in: &subscriptions)
        
            }
    
    
    func getHeroSeries(){
//        self.status = .loading
//        cancelAll()
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkManager().getSessionHeroSeries(heroId: heroId))
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
//                    self.status = Status.loaded
                    print("Success")
                }
            } receiveValue: { data in
                self.series = data.data.results
            }
            .store(in: &subscriptions)
        
            }
}
