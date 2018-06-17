//
//  ViewController.swift
//  TicTacToe
//
//  Created by Filip on 14.06.2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var board: UIImageView!
    
    var player = 1
    
    var activeGame = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func button(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = player
            
            if player == 1 {
                label.text = ""
                sender.setImage(UIImage(named: "cross.png"), for: [])
                player = 2
                
            } else {
                
                sender.setImage(UIImage(named: "nought.png"), for: [])
                player = 1
                
            }
        
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    activeGame = false

                    self.label.isHidden = false
                    self.againButton.isHidden = false
                    
                if gameState[combination[0]] == 1 {
                        
                        label.text =  "Player crosses has won!! "
                        
                } else  {
                    
                        label.text =  "Player noughts has won!! "
                    
                }
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.againButton.center = CGPoint(x: self.againButton.center.x, y: self.againButton.center.y + 100)
                        self.label.center = CGPoint(x: self.label.center.x + 500, y: self.label.center.y)
                        
                    })
                    
                }

           }
            
        }
        
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var againButton: UIButton!
    
    @IBAction func againButtonPressed(_ sender: Any) {
        
        player = 1
        
        activeGame = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        label.text = "Crosses Starting"
        
        againButton.isHidden = true
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
            board.alpha = 0
            
            UIView.animate(withDuration: 1, animations: {

                   self.board.alpha = 1
                
            })
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.isHidden = true
        againButton.isHidden = true
        self.label.center = CGPoint(x: self.label.center.x - 500, y: self.label.center.y)
        self.againButton.center = CGPoint(x: self.againButton.center.x, y: self.againButton.center.y - 500)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

