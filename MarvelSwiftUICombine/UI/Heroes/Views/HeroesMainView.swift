//
//  RootView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 13/11/22.
//

import SwiftUI

struct HeroesMainView: View {
    @EnvironmentObject var viewModel: HeroesViewModel
    
    var body: some View {
        
        switch viewModel.status {
            
        case .none:
            Text("Start App")
        case .loading:
            LoadingView()
                .id("LoadingView")
        case .error(error: let errorString):
            ErrorHeroesView(error: errorString)
                .id("ErrorHeroesView")
        case .loaded:
            HeroesView()
                .id("HeroesView")
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesMainView()
            .environmentObject(HeroesViewModel())
    }
}
