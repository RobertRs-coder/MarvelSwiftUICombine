//
//  MarvelSwiftUICombineWatchApp.swift
//  MarvelSwiftUICombineWatch
//
//  Created by Roberto Rojo Sahuquillo on 17/11/22.
//

import SwiftUI

@main
struct MarvelSwiftUICombineWatchApp: App {
    var body: some Scene {
        WindowGroup {
            HeroesMainView()
                .environmentObject(HeroesViewModel())
        }
    }
}
