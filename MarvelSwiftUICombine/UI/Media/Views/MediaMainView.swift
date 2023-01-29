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
                .id("LoadingView")
        case .error(error: let errorString):
            ErrorMediaView(error: errorString)
                .id("ErrorMediaView")
        case .loaded:
            MediaView(viewModel: viewModel)
                .id("MediaView")
        }
    }
}

struct MediaMainView_Previews: PreviewProvider {
    static var previews: some View {
        MediaMainView(viewModel: MediaViewModel(heroId: 1017857, heroName: "Peggy Carter (Captain Carter)"))
    }
}
