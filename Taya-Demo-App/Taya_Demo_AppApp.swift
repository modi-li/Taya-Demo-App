//
//  Taya_Demo_AppApp.swift
//  Taya-Demo-App
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

@main
struct Taya_Demo_AppApp: App {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
