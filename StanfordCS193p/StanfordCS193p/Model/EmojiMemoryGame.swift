//
//  EmojiMemoryGame.swift
//  StanfordCS193p
//
//  Created by Samuel Owino on 13/12/2021.
//

import Foundation

struct EmojiMemoryGame<CardContent> {
    var cards: Array<Card>
    
    func chooseCard(_ card:Card){
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var contents: CardContent
    }
}
