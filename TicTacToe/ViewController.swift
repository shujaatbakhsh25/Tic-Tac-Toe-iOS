//
//  ViewController.swift
//  TicTacToe
//
//  Created by Shujaat Bakhsh on 3/16/19.
//  Copyright © 2019 Shujaat Bakhsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var winnerName: UILabel!
    
    @IBOutlet weak var Player1: UILabel!
    
    @IBOutlet weak var Player2: UILabel!
    
    @IBAction func Play(_ sender: Any) {
        performSegue(withIdentifier: "gameBoard", sender: nil)
    }
    
    
    
    @IBAction func changeName(_ sender: Any) {
        displayEnterName()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func displayEnterName(){
        
        let alert = UIAlertController(title: "Player Names", message: "Enter the names of players \n Defaults to Player 1 and Player 2", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Name of Player 1"
            textField.borderStyle = .roundedRect
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Name of Player 2"
            textField.borderStyle = .roundedRect
        }
        let add = UIAlertAction(title: "OK", style: .default) { (action) in
            let name1 = alert.textFields![0].text!
            let name2 = alert.textFields![1].text!
            if name1.isEmpty{
                self.Player1.text = "Player 1"
            }
            else {
                self.Player1.text = "Player 1 : \(name1)"
            }
            if name2.isEmpty{
                self.Player2.text = "Player 2"
            }
            else {
                self.Player2.text = "Player 2 : \(name2)"
            }
            
        }
        alert.addAction(add)
        present(alert, animated: true, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let game = segue.destination as! GameBoardViewController
        game.player1 = self.Player1.text!
        game.player2 = self.Player2.text!
    }
    override func viewDidAppear(_ animated: Bool) {
        let result = results.winnerName
        self.winnerName.text = "Winner : \(result)"
    }
}

