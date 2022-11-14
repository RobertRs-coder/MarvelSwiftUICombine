//
//  RootView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 13/11/22.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var viewModel: HeroesViewModel
    var body: some View {
        switch viewModel.status {
        case .none:
            Text("Dafault Status")
        case .loading:
            LoadingView()
        case .error(error: let errorString):
            ErrorView(error: errorString)
        case .loaded:
            HeroesView()
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(HeroesViewModel())
    }
}
