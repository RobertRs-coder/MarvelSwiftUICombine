//
//  Views + Extensions.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 28/11/22.
//

import Foundation
import SwiftUI

extension View {
    
    func gesScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        let diff = abs(x)
        
        if diff < 100 {
            scale += (100 - diff) / 500
        }
        
        return scale
    }
    
}
