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
        
        switch rootViewModel.status {
            
        case .none:
            Text("Start App")
        case .loading:
            LoadingView()
        case .error(error: let errorString):
            ErrorView(error: errorString)
        case .loaded:
            HeroesView(viewModel: HeroesViewModel())
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesMainView()
            .environmentObject(RootViewModel())
    }
}
