//
//  ViewController.swift
//  TicTacToeinSwift4
//
//  Created by Chaman Gurjar on 03/01/19.
//  Copyright © 2019 Chaman Gurjar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 - is noughts and 2 - crosses
    private var activePlayer = 1
    private var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]  // 0 - Empty, 1 - is noughts and 2 - crosses
    let winingCombinations = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //    MARK: - Button's Action
    @IBAction func buttonPressed(_ sender: UIButton) {
        let activePosition = sender.tag - 1
        if gameState[activePosition] == 0 {
            
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
                    //                    We got the winner
                }
            }
            
        }
        
    }
    
    
}

