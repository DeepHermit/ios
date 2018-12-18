//
//  card.swift
//  seventh
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import Foundation

struct Card {
    var isfront = false
    var isMatched = false
    var identifier:Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
