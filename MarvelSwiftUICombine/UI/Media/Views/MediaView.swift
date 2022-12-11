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
    private var watchOS = false
    
    init(viewModel: MediaViewModel){
        self.viewModel = viewModel

        #if os(watchOS)
//        //Problem with text size in watchOS
//        appearance.largeTitleTextAttributes = [
//                    .font : UIFont.systemFont(ofSize: 10)]
        watchOS = true
        #else
        //This isn't work because because later I modify the displaymode
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
                    .font : UIFont.systemFont(ofSize: 15)]
        #endif
        
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
            .navigationBarTitleDisplayMode(watchOS ? .inline : .large)
            .navigationBarTitle(viewModel.heroName)
        }
        
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView(viewModel: MediaViewModel(heroId: 1017857, heroName: "Peggy Carter (Captain Carter)"))
    }
}
