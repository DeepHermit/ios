//
//  Concentration.swift
//  seventh
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import Foundation
class Concentration{
    var scores = 0
    var cards = [Card]()
    
    var indexOfpreCard:Int = -1
    
    
    func chooseCard(at index:Int) {
        if !cards[index].isMatched{
            if indexOfpreCard == -1{
                indexOfpreCard = index
                for i in 0...35 {
                    if !cards[i].isMatched{
                        cards[i].isfront=false
                    }
                }
                cards[index].isfront=true
            }else{
                if(cards[index].identifier == cards[indexOfpreCard].identifier){
                    scores+=2
                    cards[index].isMatched=true
                    cards[indexOfpreCard].isMatched=true
                }else{
                    scores-=2
                    cards[index].isfront=true
                    cards[indexOfpreCard].isfront=true
                }
                indexOfpreCard = -1
            }
        }
    }
    init(numberOfPairsOfCards:Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards+=[card,card]
        }
        cards.sort { _,_ in arc4random_uniform(2) > 0 }
    }
}
