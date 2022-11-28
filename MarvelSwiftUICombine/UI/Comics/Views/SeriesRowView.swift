//
//  SeriesRowView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 28/11/22.
//
import SwiftUI

struct SeriesRowView: View {
    var serie: Serie
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            ZStack{
                VStack{
                    AsyncImage(url: URL(string: "\(serie.thumbnail.path)/standard_xlarge.jpg")) { photoDownloaded in
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
                  
                    Text("\(serie.title)")
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

//struct SeriesRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SeriesRowView()
//    }
//}
