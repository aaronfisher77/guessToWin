//
//  Game.swift
//  guessToWin
//
//  Created by Aaron Fisher on 10/10/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class Game: UIViewController {
    
    
    @IBOutlet weak var InfoButton: UILabel!
    @IBOutlet weak var usersGuess: UITextField!
    @IBOutlet weak var chosenRange: UILabel!
    
    //@IBOutlet weak var dataLabel: UILabel!
    var passedData: (difficulty: Int, randomNumber: Int) = (0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenRange.text = String("Guess a number from 0 to \(passedData.difficulty)")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        if Int(usersGuess.text!) != nil {
            if Int(usersGuess.text!) == passedData.randomNumber {
                InfoButton.text = ("You guessed it Congradulations!")
            } else if Int(usersGuess.text!)! < passedData.randomNumber{
                InfoButton.text = ("Nope, thats to low.")
            }else if Int(usersGuess.text!)! > passedData.randomNumber{
                InfoButton.text = ("Nope thats too high")
            }else{
                InfoButton.text = ("Thats not a valid input.")
            }
        }
    }
    
    
    
}
