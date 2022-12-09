//
//  ErrorHeroesView.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 14/11/22.
//

import SwiftUI

struct ErrorHeroesView: View {
    private var textError: String
    
    init(error: String){
        textError = error
    }
    var body: some View {
        ZStack{
            //We need it to change the unsafe area color
            Color.red
                .opacity(0.3)
            .ignoresSafeArea()
            //The Error Functionality
            VStack{
                Spacer()
                Image(systemName: "exclamationmark.bubble")
                    .resizable()
                    .foregroundColor(.red)
                #if os(watchOS)
                    .frame(width: 50, height: 50)
                #else
                    .frame(width: 200, height: 200)
                #endif
                    .padding()
                Text(textError)
                    .foregroundColor(.red)
                    .font(.headline)
                Spacer()
            }
        }
    }
}

struct ErrorHeroesView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorHeroesView(error: "Error test")
    }
}
