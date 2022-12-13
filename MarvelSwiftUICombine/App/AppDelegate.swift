//
//  AppDelegate.swift
//  MarvelSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 11/12/22.
//

import UIKit

#if os(iOS)

class AppDelegate: NSObject, UIApplicationDelegate {

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let appearance = UINavigationBarAppearance()

        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
        
        appearance.largeTitleTextAttributes = attrs
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        return true
    }
}

#endif
