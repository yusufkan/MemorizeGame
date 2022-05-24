//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yusufkan Sürmelioğlu on 16.05.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
