//
//  MatchingGameApp.swift
//  MatchingGame
//
//  Created by 최정현 on 2022/11/07.
//

import SwiftUI

@main
struct MatchingGameApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
