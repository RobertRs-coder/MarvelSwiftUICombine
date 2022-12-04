//
//  HeroesViewModel.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 20/11/22.
//

import Foundation
import SwiftUI
import Combine

final class HeroesViewModel: ObservableObject {
    
    @Published var heroes: [Hero]?
//    @Published var comics: [Comic]?
//    @Published var comics: [Comic]?
    @Published var status = Status.none
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(){
        getHeroes()
    }
        
    func getHeroes(){
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: NetworkManager().getSessionHeroes())
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    self.status = .error(error: "Error")
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: HeroDataWrapper.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.status = Status.error(error: error.localizedDescription)
                case .finished:
                    self.status = Status.loaded
                }
            } receiveValue: { data in
                self.heroes = data.data.results
            }
            .store(in: &subscriptions)
        
        
            }
}

