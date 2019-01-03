//
//  ViewController.swift
//  TicTacToeinSwift4
//
//  Created by Chaman Gurjar on 03/01/19.
//  Copyright © 2019 Chaman Gurjar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // 1 - is noughts and 2 - crosses
    private var activePlayer = 1
    private var activeGame = true
    private var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]  // 0 - Empty, 1 - is noughts and 2 - crosses
    let winingCombinations = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideLabelAndButtonAndMakeReadyForAnimation()
    }
    
    //    MARK: - Button's Action
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let activePosition = sender.tag - 1
        if gameState[activePosition] == 0  && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought"), for: .normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross"), for: .normal)
                activePlayer = 1
            }
            
            winingCombinations.forEach { (combination) in
                let isWin = gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]]
                    && gameState[combination[1]] == gameState[combination[2]]
                
                if isWin {
                    
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "Nought has won!"
                    } else {
                        winnerLabel.text = "Cross has won!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    })
                    
                }
            }
            
        }
        
    }
    
    
    private func hideLabelAndButtonAndMakeReadyForAnimation() {
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        //Taking button and label outside of screen for animation
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] 
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
        hideLabelAndButtonAndMakeReadyForAnimation()
    }
}

