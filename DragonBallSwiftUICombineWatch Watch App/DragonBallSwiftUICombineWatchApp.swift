//
//  DragonBallSwiftUICombineWatchApp.swift
//  DragonBallSwiftUICombineWatch Watch App
//
//  Created by Roberto Rojo Sahuquillo on 17/11/22.
//

import SwiftUI

@main
struct DragonBallSwiftUICombineWatch_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            HeroesMainView()
                .environmentObject(HeroesViewModel())
        }
    }
}
