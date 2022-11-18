//
//  EmojiMemoryGame.swift
//  MatchingGame
//
//  Created by 최정현 on 2022/11/08.
//

import SwiftUI


class EmojiMemoryGame : ObservableObject {
    @Published private var themeIndex = 0
    private var modelList = [EmojiMemoryGame.createMemoryGame(theme: ["🎃","👻","🕷️","⌚️","📱","💾","💽","🚗","🚕","🚙","🚌"]),
                         EmojiMemoryGame.createMemoryGame(theme: ["1","2","3","4","5","6","7","8","9"]),
                         EmojiMemoryGame.createMemoryGame(theme: ["A","B","C","D","E","F","G","H"])]
    
    private var themeList = createThemes()
    
    static func createThemes() -> Array<Theme> {
        var themes = Array<Theme>()
        let themeArray: Array<[String]> =  [["😀", "emojis"],
                       ["1️⃣", "number"],
                       ["🔠", "alphabet"]]
        for (index, item) in themeArray.enumerated() {
            themes.append(Theme(icon: item[0], text: item[1], id: index))
        }
        return themes
    }
    
    static func createMemoryGame(theme emojis: Array<String>) -> MemoryGame<String> {
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    func selectTheme(index: Int) {
        print("theme: \(index)")
        themeIndex = index
        modelList[themeIndex].cards.shuffle()
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        modelList[themeIndex].cards
    }
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        modelList[themeIndex].choose(card: card)
    }
    
    // MARK: - Game title
    var title: String {
        modelList[themeIndex].title
    }
    
    // MARK: - Themes
    var themes: Array<Theme> {
        themeList
    }
    
    struct Theme: Identifiable {
        var icon: String
        var text: String
        var id: Int
    }
}
