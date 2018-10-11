//
//  Game.swift
//  guessToWin
//
//  Created by Aaron Fisher on 10/10/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class Game: UIViewController {
    
    // Defines each variable that is dragged from the ViewControllers
    @IBOutlet weak var InfoButton: UILabel!
    @IBOutlet weak var usersGuess: UITextField!
    @IBOutlet weak var chosenRange: UILabel!
    @IBOutlet weak var guessesUsed: UILabel!
    @IBOutlet weak var guessesRemaining: UILabel!
    
    // Creates vaiables that allows extra information in the game and sets different aspecs (difficulty, Selecting the random number, and "deciding" how many guesses will be alloted
    var usedCounter: Int = 0
    var passedData: (difficulty: Int, randomNumber: Int, counter: Int) = (0,0,0)
    
    // This override functions allows the screen to load up before the user sees it.
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenRange.text = String("Guess a number from 0 to \(passedData.difficulty)") // Tells the used what range to guess from
        guessesRemaining.text = ("Guesses Remaining: \(passedData.counter)") // Tells the user how many guesses they will recieve.
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButton(_ sender: Any) { // This will tell the computer to check the Users input and see how it should respond to the number it was given.
        if Int(usersGuess.text!) != nil { // this wikl verify that the number was uin fact a number.
            if Int(usersGuess.text!)! > passedData.difficulty && Int(usersGuess.text!)! < 0 { // this checkes to make sure the number was inside of the given range.
                InfoButton.text = ("Please choose a number inside the current range.")
                }else if Int(usersGuess.text!) == passedData.randomNumber { // this will check to see if the users number is in fact the number that was randomly chosen at in the ViewController file.
                    InfoButton.text = ("You guessed it Congratulations!")
                }else if Int(usersGuess.text!)! < passedData.randomNumber &&  passedData.counter >= 1{
                    InfoButton.text = ("Nope, thats to low.")
                    passedData.counter -= 1
                    guessesRemaining.text = ("Guesses Used: \( passedData.counter)")
                    usedCounter += 1
                    guessesUsed.text = ("Guesses Used: \(usedCounter)")
                }else if Int(usersGuess.text!)! > passedData.randomNumber &&  passedData.counter >= 1{
                    InfoButton.text = ("Nope thats too high")
                    passedData.counter -= 1
                    guessesRemaining.text = ("Guesses Used: \( passedData.counter)")
                    usedCounter += 1
                    guessesUsed.text = ("Guesses Used: \(usedCounter)")
                }else{
                    usersGuess.text = ("-")
                    InfoButton.text = ("Well thats to Bad you lost")
                }
            }
        }

    
}
