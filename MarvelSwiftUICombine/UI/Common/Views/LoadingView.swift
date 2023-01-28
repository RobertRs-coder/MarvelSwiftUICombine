//
//  LoadingView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 14/11/22.
//

import SwiftUI

struct LoadingView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack{
            Circle()
                .fill(.red)
                .frame(width: 150, height: 150, alignment: .center)
                .scaleEffect(animate ? 1.0 : 0.5)
                .animation(.easeInOut(duration: 0.5).repeatForever(), value: animate)
                .id("Circle")
            
            Text("Loading")
                .foregroundColor(.white)
                .padding()
                .id("Text")
        }
//        .task {
//            self.animate = true
//        }
        .onAppear{
            DispatchQueue.main.async {
                self.animate = true
            }
        }
        .onDisappear{
            self.animate = false
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
