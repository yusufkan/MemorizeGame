//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yusufkan Sürmelioğlu on 24.05.2022.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
    
    return EmojiMemoryGame.vehicles[index]
}

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createRandomMemoryGame(theme: theme)
    }
    
    static let vehicles: [String] = ["🛳","🚃","🚲","🚗","⛵️","🚤","🚀","🛸","🚁","🛶","🛻","🏎","🚜","🚒","🚠","🚉","🚂","🛵","🚌","🏍","🚓","🚛","🚅","🚑"]
    
    static var themes: Array<Theme> = [
        Theme(name: "Vehicles",
              emojis: ["🛳","🚃","🚲","🚗","⛵️","🚤","🚀","🛸","🚁","🛶","🛻","🏎","🚜","🚒","🚠","🚉","🚂","🛵","🚌","🏍","🚓","🚛","🚅","🚑"],
              numberOfPairsOfCards: 8,
              color: "red"
             ),
        Theme(name: "Foods",
              emojis: ["🥦","🥕","🌶","🥒","🥐","🧀","🥩","🧇","🍔","🌮","🍕","🎂","🧁","🍦","🍪"],
              numberOfPairsOfCards: 8,
              color: "green"
             ),
        Theme(name: "Halloween",
              emojis: ["🕸","🕷","👻","🎃","💀","🎃","🧙","🧛‍♂️","🧟"],
              numberOfPairsOfCards: 6,
              color: "orange"
             ),
        Theme(name: "Fruits",
              emojis: ["🍏","🍎","🍐","🍊","🍉","🍌","🍇","🍓","🍑","🍒","🥝","🫐","🍍"],
              numberOfPairsOfCards: 8,
              color: "yellow"
             ),
    ]
    
    static func createRandomMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { index in
            return theme.emojis[index]}
                
    }
    var score: Int {
        return model.score
    }
    
    private var theme: Theme
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        default:
            return .red
        }
    }
    
    var themeName: String {
        return theme.name
    }
    
    @Published private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createRandomMemoryGame(theme: theme)
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    

}
