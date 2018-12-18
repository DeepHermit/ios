//
//  ViewController.swift
//  seventh
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var scores: UILabel!
    @IBOutlet weak var newGame: UIButton!
    
    @IBOutlet var cards: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    lazy var game = Concentration(numberOfPairsOfCards: 18)
    
    @IBAction func touchcard(_ sender: UIButton) {
        if let cardNumber = cards.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
           
        }
    }
    var themes = [0:["🎃","👻","🐶","🐱","🐭","🐹","🦊","🐼","🐵","🐮","🐸","⌚️","📱","💻","🖨","🖥","⌨️","💽","🗜","🕹","💾","☎️"],
                  1:["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍑","🍒","🍓","🇦🇱","🇩🇿","🇦🇫","🏳️‍🌈","🇦🇷","🇦🇪","🇦🇼","🇴🇲","🇮🇪","🇪🇹","🇪🇬"],
                  2:["⚽️","🏀","🏈","⚾️","🎱","🏉","🏐","🎾","🏓","🏸","🏒","🚗","🚕","🚙","🚌","🚑","🚓","🏎","🚎","🚒","🚚","🛵"]]
    lazy var emojiChoices = themes[0]!
    var emoji = [Int: String]()
    @IBAction func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (18))
        let them = Int(arc4random_uniform(UInt32(themes.keys.count)))
        emojiChoices = themes[them]!
        updateViewFromModel()
    }
    
    
    
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    func updateViewFromModel() {
        for index in cards.indices {
            let button = cards[index]
            let card = game.cards[index]
            if card.isMatched{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = UIColor.darkGray
            }else{
                if card.isfront{
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
                }else{
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = UIColor.lightGray
                }
            }
            scores.text = "Score: \(game.scores)"
        }
    }
}
