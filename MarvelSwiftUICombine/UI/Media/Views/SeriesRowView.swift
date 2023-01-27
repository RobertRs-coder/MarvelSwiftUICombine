//
//  SeriesRowView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 29/11/22.
//

import SwiftUI

struct SeriesRowView: View {
    @ObservedObject var viewModel: MediaViewModel
    @Binding var animationAmount: Int
    
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 50){
                if let series = viewModel.series{
                    ForEach(series) { serie in
                        GeometryReader { proxy in
                            
                            VStack{
                                let scale = getScale(proxy: proxy)
                                
                                AsyncImage(url: URL(string: "\(serie.thumbnail.path)/portrait_large.jpg")) { photoDownloaded in
                                    photoDownloaded
                                        .resizable()
#if os(watchOS)
                                        .frame(width: 100, height: 100)
#else
                                        .frame(width: 150, height: 225)
#endif
                                        .scaledToFit()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(lineWidth: 0.5)
                                        )
                                        .clipped()
                                        .cornerRadius(5)
                                        .shadow(radius: 5)
                                        .scaleEffect(CGSize(width: scale, height: scale))
                                    //                                            .animation(.easeInOut(duration: 0.5))  //<iOS 16
                                        .animation(.easeInOut(duration: 0.5), value: animationAmount)
                                } placeholder: {
                                    Image(systemName: "photo")
                                        .resizable()
#if os(watchOS)
                                        .frame(width: 100, height: 100)
#else
                                        .frame(width: 150, height: 225)
#endif
                                        .scaledToFit()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(lineWidth: 0.5)
                                        )
                                        .clipped()
                                        .cornerRadius(5)
                                        .shadow(radius: 5)
                                        .scaleEffect(CGSize(width: scale, height: scale))
                                    //                                            .animation(.easeInOut(duration: 0.5))  //<iOS 16
                                        .animation(.easeInOut(duration: 0.5), value: animationAmount)
                                }
                                Text("\(serie.title)")
                                    .padding(.top)
                                    .multilineTextAlignment(.center)
                            }
                            
                        }
        //                            .background(.red) //At first is need it to see the exact frame
                        
                        
#if os(watchOS)
                        .frame(width: 75, height: 150)
#else
                        .frame(width: 150, height: 300)
#endif
                    }
                }
            }
            .padding(32)
        }
    }
}

struct SeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRowView(viewModel: MediaViewModel(heroId: 1017857, heroName: "Peggy Carter (Captain Carter)"), animationAmount: .constant(1))
    }
}
