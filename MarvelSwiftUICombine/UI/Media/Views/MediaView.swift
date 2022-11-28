//
//  MediaView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 28/11/22.
//

import SwiftUI

struct MediaView: View {
    @StateObject var viewModel: MediaViewModel
    
    
    var body: some View {
        ComicsView(viewModel: MediaViewModel(hero: viewModel.hero))
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView(viewModel: MediaViewModel(hero: Hero(id: 1, name: "Hit-Monkey", description: "Something", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: .jpg), resourceURI: "")))
    }
}
