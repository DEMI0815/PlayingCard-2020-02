//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Yidi Zhao on 2019/12/23.
//  Copyright © 2019 Yidi Zhao. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    private var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }

    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.random)
        } else {
            return nil
        }
    }
}

extension Int {
    var random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
