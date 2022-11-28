//
//  ComicsRowView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 15/11/22.
//

import SwiftUI

struct ComicsRowView: View {
    var comic: Comic
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            ZStack{
                VStack{
                    AsyncImage(url: URL(string: "\(comic.thumbnail.path)/standard_xlarge.jpg")) { photoDownloaded in
                        photoDownloaded
                            .resizable()
                            .frame(width:300, height: 300)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .padding([.leading,.trailing], 5)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width:300, height: 300)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .padding([.leading,.trailing], 5)
                    }
                  
                    Text("\(comic.title)")
                        .lineLimit(2)//
                        .frame(width:300, height: 100)
                        .bold()
                        .padding(10)
                    
                }
                .padding(10)
                
            }
        }
    }
}
        
//        HStack{
//            ZStack{
//            AsyncImage(url: URL(string: "\(comic.thumbnail.path)/standard_xlarge.jpg")) { photoDownloaded in
//                photoDownloaded
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(15)
//                    .padding([.leading,.trailing], 5)
//            } placeholder: {
//                Image(systemName: "photo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(15)
//                    .padding([.leading,.trailing], 5)
//            }
//
//            Text("\(comic.title)")
//                .font(Font.custom("Marker Felt Thin", size: 26, relativeTo: .title2))
//            //                .bold()
//                .padding(10)
//        }
//        .padding(20)
//        .background(Color.mint)
//        .cornerRadius(20)
//        .opacity(0.8)
//
//
//        Text("\(comic.title)")
//            .font(Font.custom("Marker Felt Thin", size: 26, relativeTo: .title2))
//        //                .bold()
//            .padding(10)
//        }
//    }
//}
//
//struct ComicsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ComicsRowView(comic: <#Comic#>)
//    }
//}
