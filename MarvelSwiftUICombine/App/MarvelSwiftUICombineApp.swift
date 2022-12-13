//
//  MarvelSwiftUICombineApp.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 13/11/22.
//

import SwiftUI

@main
struct MarvelSwiftUICombineApp: App {
    
    var body: some Scene {
        WindowGroup {
            HeroesMainView()
                .environmentObject(HeroesViewModel())
        }
    }
}
