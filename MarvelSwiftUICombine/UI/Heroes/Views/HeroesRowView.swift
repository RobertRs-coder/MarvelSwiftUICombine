//
//  HeroesRowView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 14/11/22.
//

import SwiftUI

struct HeroesRowView: View {
    var hero: Hero
    
    var body: some View {
        
        ZStack(alignment: Alignment.center) {
            AsyncImage(url: URL(string: "\(hero.thumbnail.path)/standard_large.jpg")) { photoDownloaded in
                photoDownloaded
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding([.leading,.trailing], 5)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                    .padding([.leading,.trailing], 5)
            }
            
            Text("\(hero.name)")
#if os(watchOS)
                .font(.title3)
#else
                .font(.title)
#endif
                .padding([.leading,.trailing], 5)
        }
        .padding(10)
        .background(Color.red.opacity(0.9))
        .cornerRadius(20)
        .opacity(0.8)
    }
}

struct HerosRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(hero: Hero(id: 1, name: "Hit-Monkey", description: "Something", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: .jpg), resourceURI: ""))
    }
}
