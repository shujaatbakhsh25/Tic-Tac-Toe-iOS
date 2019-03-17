//
//  GameBoardViewController.swift
//  TicTacToe
//
//  Created by Shujaat Bakhsh on 3/16/19.
//  Copyright © 2019 Shujaat Bakhsh. All rights reserved.
//

import UIKit


class GameBoardViewController: UIViewController {

    var activePlayer = 1
    var player1 = ""
    var player2 = ""
    var gameState  = ["","","","","","","","",""]
    
    
    
    @IBOutlet weak var Turn: UILabel!
    @IBAction func Tap(_ sender: UIButton) {
       if (activePlayer == 1){
            sender.setTitle("X", for: UIControl.State.normal)
            sender.isEnabled = false
            activePlayer = 2
            self.Turn.text = "\(player2)'s turn!"
            gameState[sender.tag] = "X"
            let test = checkGameState()
        if test {
            results.winnerName = "\(player1)"
            results.p1 += 1
            let nav = self.navigationController
            nav?.popViewController(animated: true)
        }
        else if !gameState.contains("") && !checkGameState(){
            results.winnerName = "Its a draw"
            let nav = self.navigationController
            nav?.popViewController(animated: true)
            
        }
        
        }
        else{
            sender.setTitle("O", for: UIControl.State.normal)
            sender.isEnabled = false
            activePlayer = 1
            self.Turn.text = "\(player1)'s turn!"
            gameState[sender.tag] = "O"
        if checkGameState(){
            results.winnerName = "\(player2)"
            results.p2 += 1
            let nav = self.navigationController
            nav?.popViewController(animated: true)
        }
        else if !gameState.contains("") && !checkGameState(){
            results.winnerName = "Its a draw"
            let nav = self.navigationController
            nav?.popViewController(animated: true)
        }
        }
        
    }
    
    func checkGameState() -> Bool{
        //row wise check
        if gameState[0] != "" && gameState[0]==gameState[1] && gameState[1]==gameState[2]{
            return true
        }
        else if gameState[3] != "" && gameState[3]==gameState[4] && gameState[4]==gameState[5]{
            return true
        }
        else if gameState[6] != "" && gameState[6]==gameState[7] && gameState[7]==gameState[8]{
            return true
        }
    
        // diagonal check
        else if gameState[0] != "" && gameState[0]==gameState[4] && gameState[4]==gameState[8]{
            return true
        }
        else if gameState[2] != "" && gameState[2]==gameState[4] && gameState[4]==gameState[6]{
            return true
        }
        // column wise check
        else if gameState[0] != "" && gameState[0]==gameState[3] && gameState[3]==gameState[6]{
            return true
        }
        else if gameState[1] != "" && gameState[1]==gameState[4] && gameState[4]==gameState[7]{
            return true
        }
        else if gameState[2] != "" && gameState[2]==gameState[5] && gameState[5]==gameState[8]{
            return true
        }
        return false
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let name = segue.destination as! ViewController
//        name.winnerName.text = self.winnerName
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Turn.text = "\(player1)'s turn!"
    }
}
