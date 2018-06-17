//
//  ViewController.swift
//  TicTacToe
//
//  Created by Filip on 14.06.2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // player 1 is crosses , player 2 is noughts
    var player = 1
    
    var activeGame = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = player
            
            if player == 1 {
            
                sender.setImage(UIImage(named: "cross.png"), for: [])
                player = 2
            
            } else {
            
                sender.setImage(UIImage(named: "nought.png"), for: [])
                player = 1
            
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    activeGame = false
                    print(gameState[combination[0]])
                    
                }
                
                
            }
            
       // sender.setImage(UIImage(named: "cross.png"), for: [])
        
        //print(sender.tag)
        
    
            
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

