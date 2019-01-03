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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //    MARK: - Button's Action
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if activePlayer == 1 {
            sender.setImage(UIImage(named: "nought"), for: .normal)
            activePlayer = 2
        } else {
            sender.setImage(UIImage(named: "cross"), for: .normal)
            activePlayer = 1
        }
        
    }
    
    
}

