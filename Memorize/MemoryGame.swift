//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yusufkan Sürmelioğlu on 24.05.2022.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private(set) var score = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func matchCardsAddScore(index: Int, index2: Int) {
        cards[index].isMatched = true
        cards[index2].isMatched = true
        score += 2
    }
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                //if there was already one and only one card face up
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    //if both cards have the same content match them
                    matchCardsAddScore(index: chosenIndex, index2: potentialMatchIndex)
                } else {
                    if cards[chosenIndex].hasAlreadyBeenSeen || cards[potentialMatchIndex].hasAlreadyBeenSeen {
                        //if one of the cards has already been seen, give penalty
                        score -= 1
                    }
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].isFaceUp = false
                        cards[index].hasAlreadyBeenSeen = true
                    }
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(index)
            cards.append(Card(content: content, id: index*2))
            cards.append(Card(content: content, id: index*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var hasAlreadyBeenSeen: Bool = false
        var id: Int
    }
}
