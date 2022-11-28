//
//  MediaMainView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 20/11/22.
//

import SwiftUI
import Combine

struct MediaMainView: View {
    @StateObject var viewModel: MediaViewModel
    
    var body: some View {
        
        switch viewModel.status {
            
        case .none:
            Text("Start App")
        case .loading:
            LoadingView()
        case .error(error: let errorString):
            ErrorView(error: errorString)
        case .loaded:
            MediaMainView(viewModel: viewModel)
    }
}

struct MediaMainView_Previews: PreviewProvider {
    static var previews: some View {
        MediaMainView(viewModel: MediaViewModel(hero: Hero(id: 1, name: "Hit-Monkey", description: "Something", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: .jpg), resourceURI: "")))
    }
}
