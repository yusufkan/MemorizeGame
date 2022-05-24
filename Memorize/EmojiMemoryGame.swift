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
    
    static let vehicles: [String] = ["🛳","🚃","🚲","🚗","⛵️","🚤","🚀","🛸","🚁","🛶","🛻","🏎","🚜","🚒","🚠","🚉","🚂","🛵","🚌","🏍","🚓","🚛","🚅","🚑"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { index in EmojiMemoryGame.vehicles[index]}
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

}
