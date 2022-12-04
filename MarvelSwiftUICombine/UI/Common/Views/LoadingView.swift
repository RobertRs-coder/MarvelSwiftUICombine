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
                .offset(x: 0.0, y: 0.0)
                .scaleEffect(animate ? 1.0 : 0.5)
                //.animation(Animation.easeInOut(duration: 0.5).repeatForever()) < iOS16
                .animation(.easeInOut(duration: 0.5).repeatForever(), value: animate)
            Text("Loading")
                .foregroundColor(.white)
                .offset(x: 0.0, y: 0.0)
                .padding()
//                .font(.title2)
        }
        .onAppear{
            self.animate = true
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
