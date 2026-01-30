//
//  ContentView.swift
//  Taya-Demo-App
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {                
            Tab("Moments", systemImage: "sparkles") {
                MomentsView()
            }
            Tab("Journal", systemImage: "pencil.and.outline") {
                JournalView()
            }
            Tab("Memories", systemImage: "clock.arrow.trianglehead.counterclockwise.rotate.90") {
                MemoriesView()
            }
            Tab("Memories", systemImage: "message", role: .search) {
                ChatsView()
            }
        }
        .accentColor(.brand300)
        .foregroundStyle(Color.shade800)
    }
}

#Preview {
    ContentView()
}
