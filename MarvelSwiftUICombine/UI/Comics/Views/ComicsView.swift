//
//  ComicsView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 15/11/22.
//

import SwiftUI

struct ComicsView: View {
    @StateObject var viewModel: MediaViewModel?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                
                if let comics = viewModel.comics{
                    ForEach(comics){ comic in
                       ComicsRowView(comic: comic)
                       
                   }
               }
              
                
            }
        }
        
        
    }
}
//        ScrollView(.horizontal, showsIndicators: true){
//            //Content -> Lazy control memory draw few objects not all
//            LazyHStack{
//                List{
//                    //TODO: For each comics on tap do ....
//                    let comics = viewModel.comics{
//                        ForEach(comics) { comic in
//                            ComicsRowView(comic: comic)
//                        }
//                    }
//                }
//
//
//            }
//        }
//    }
//}

struct ComicsView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView(viewModel: MediaViewModel(hero: Hero(id: 1, name: "Hit-Monkey", description: "Something", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: .jpg), resourceURI: "")))
    }
}
