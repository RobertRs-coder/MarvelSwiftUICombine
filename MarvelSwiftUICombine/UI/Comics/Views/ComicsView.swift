//
//  ComicsView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 15/11/22.
//

import SwiftUI

struct ComicsView: View {
    @ObservedObject var viewModel: MediaViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                ScrollView(.horizontal, showsIndicators: false){
                    if let comics = viewModel.comics{
                        ForEach(comics){ comic in
                            ComicsRowView(comic: comic)
                        }
                    }

                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    if let series = viewModel.series{
                        ForEach(series) { serie in
                            SeriesRowView(serie: serie)
                        }
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
        ComicsView(viewModel: MediaViewModel(heroId: 1))
    }
}
