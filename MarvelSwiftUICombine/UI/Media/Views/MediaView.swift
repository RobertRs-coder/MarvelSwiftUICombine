//
//  MediaView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 28/11/22.
//

import SwiftUI

struct MediaView: View {
    @ObservedObject var viewModel: MediaViewModel
    @State var animationAmount = 1

    init(viewModel: MediaViewModel){

        self.viewModel = viewModel
    }

    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                
                Text("Comics")
#if os(watchOS)
                    .font(.caption)
#else
                    .font(.title2)
#endif
                ComicsRowView(viewModel: viewModel, animationAmount: $animationAmount)

                Text("Series")
#if os(watchOS)
                    .font(.caption)
#else
                    .font(.title2)
#endif
                SeriesRowView(viewModel: viewModel, animationAmount: $animationAmount)
            }
#if os(watchOS)
            .navigationBarTitleDisplayMode(.inline)
#else
            .navigationBarTitleDisplayMode(.automatic)
#endif
            .navigationBarTitle(viewModel.heroName)
        }
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView(viewModel: MediaViewModel(heroId: 1017857, heroName: "Peggy Carter (Captain Carter)"))
    }
}
