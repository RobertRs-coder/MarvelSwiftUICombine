//
//  HeroesView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 14/11/22.
//

import SwiftUI

struct HeroesView: View {
    @EnvironmentObject var viewModel: HeroesViewModel
    
    var body: some View {
        NavigationView{
            List{
                if let heroes = viewModel.heroes{
                    ForEach(heroes) { hero in
                        HeroesRowView(hero: hero)
                    }
                    .listRowBackground(Color.teal)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.teal)

        }
    }
}


struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView()
            .environmentObject(HeroesViewModel())
    }
}
