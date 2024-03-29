//
//  SeriesRowView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 28/11/22.
//
import SwiftUI

struct ComicsRowView: View {
    @ObservedObject var viewModel: MediaViewModel
    @Binding var animationAmount: Int
    
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 50){
                
                    if let comics = viewModel.comics{
                        ForEach(comics) { comic in
                            GeometryReader { proxy in
                                
                                ScrollView(.vertical, showsIndicators: false){
                                    let scale = getScale(proxy: proxy)
                                    
                                    AsyncImage(url: URL(string: "\(comic.thumbnail.path)/portrait_large.jpg")) { photoDownloaded in
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
                                    Text("\(comic.title)")

                                        .padding(.top)
                                        .multilineTextAlignment(.center)
                                    
                                    Text(comic.description ?? "No description")
#if os(watchOS)
                                        .font(.caption2)
#else
                                        .font(.caption)
#endif
                                        .padding(.top)
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                
                            }
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

struct ComicsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsRowView(viewModel: MediaViewModel(heroId: 1017857, heroName: "Peggy Carter (Captain Carter)"), animationAmount: .constant(1))
    }
}
