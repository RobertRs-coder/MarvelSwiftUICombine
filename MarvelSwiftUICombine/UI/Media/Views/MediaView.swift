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

//        #if os(watchOS)
//        appearance.largeTitleTextAttributes = [
//                    .font : UIFont.systemFont(ofSize: 10)]
//        #else
        
//        let appearance = UINavigationBarAppearance()
//        appearance.largeTitleTextAttributes = [
//                    .font : UIFont.systemFont(ofSize: 10)]
//        #endif
        
    }

    var body: some View {
        
        NavigationStack{
            
            ScrollView{
  
                Text("Comics")
                    .font(.title2)
                ComicsRowView(viewModel: viewModel, animationAmount: $animationAmount)
                
                Text("Series")
                    .font(.title2)
                SeriesRowView(viewModel: viewModel, animationAmount: $animationAmount)
            }
            
        .navigationBarTitle(viewModel.heroName)

        }
        
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView(viewModel: MediaViewModel(heroId: 1017857, heroName: "Peggy Carter (Captain Carter)"))
    }
}
