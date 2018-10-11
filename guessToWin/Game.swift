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
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var playAgain: UIButton!
    
    // Creates vaiables that allows extra information in the game and sets different aspecs (difficulty, Selecting the random number, and "deciding" how many guesses will be alloted
    var usedCounter: Int = 0
    var passedData: (difficulty: Int, randomNumber: Int, counter: Int) = (0,0,0)
    
    
    // This override functions allows the screen to load up before the user sees it.
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenRange.text = String("Guess a number from 0 to \(passedData.randomNumber)") // Tells the used what range to guess from
        guessesRemaining.text = ("Guesses Remaining: \(passedData.counter)") // Tells the user how many guesses they will recieve.
        playAgain.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButton(_ sender: Any) { // This will tell the computer to check the Users input and see how it should respond to the number it was given.
        if Int(usersGuess.text!) != nil { // This will verify that the number was in fact a number.
            if Int(usersGuess.text!)! > passedData.difficulty && Int(usersGuess.text!)! < 0 { // This checkes to make sure the number was inside of the given range.
                InfoButton.text = ("Please choose a number inside the current range.")
                }else if Int(usersGuess.text!) == passedData.randomNumber { // This will check to see if the users number is in fact the number that was randomly chosen at in the ViewController file.
                    InfoButton.text = ("You guessed it Congratulations!")
                    stackView.isHidden = true
                    playAgain.isHidden = false
                    
                
            
                }else if Int(usersGuess.text!)! < passedData.randomNumber &&  passedData.counter >= 1{ // Checks to see if the number you chose is lower than the random number.
                    InfoButton.text = ("Nope, thats to low.")
                    passedData.counter -= 1 // Takes one away from the the Users remaining guesses
                    guessesRemaining.text = ("Guesses Used: \( passedData.counter)")
                    usedCounter += 1 // Adds one to the amount of guesses the user has used
                    guessesUsed.text = ("Guesses Used: \(usedCounter)")
                    usersGuess.text = ("") // Sets the user input back to nothing so that the user doesnt have to press bak on their previous guess
                
                }else if Int(usersGuess.text!)! > passedData.randomNumber &&  passedData.counter >= 1{// Checks to see if the number you chose is higher than the random number.
                    InfoButton.text = ("Nope thats too high")
                    passedData.counter -= 1 // Takes one away from the the Users remaining guesses
                    guessesRemaining.text = ("Guesses Used: \( passedData.counter)")
                    usedCounter += 1 // adds one to the amount of guesses the user has used
                    guessesUsed.text = ("Guesses Used: \(usedCounter)")
                    usersGuess.text = ("") // Sets the user input back to nothing so that the user doesnt have to press bak on their previous guess
                }else{ // When the user runs out of guesses the text becomes 0 and it prints the text below...
                    usersGuess.text = ("-")
                    InfoButton.text = ("Well thats to Bad you lost")
                }
            }
        }

    
}
