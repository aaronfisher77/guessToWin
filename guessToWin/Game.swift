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
    @IBOutlet weak var congratulationsKey: UILabel!
    @IBOutlet weak var quitScreen: UIButton!
    @IBAction func quitButton(_ sender: Any) {
        exit(0);
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func easyWins(){
        let defaults = UserDefaults.standard // Saves the data (Persistance)
        
        let wins = defaults.integer(forKey: "easyWins")
        
        defaults.set(wins + 1, forKey: "easyWins") //Adds 1 to the loses in easy mode
    }
    
    func easyLoses(){
        let defaults = UserDefaults.standard // Saves the data (Persistance)
        
        let lost = defaults.integer(forKey: "easyLoses")
        
        defaults.set(lost + 1, forKey: "easyLoses") //Adds 1 to the wins in easy mode
    }
    
    
    func mediumWins(){
        let defaults = UserDefaults.standard // Saves the data (Persistance)
        
        let wins = defaults.integer(forKey: "mediumWins")
        
        defaults.set(wins + 1, forKey: "mediumWins") //Adds 1 to the wins in easy mode
    }
    func mediumLoses(){
        let defaults = UserDefaults.standard // Saves the data (Persistance)
        
        let lost = defaults.integer(forKey: "mediumLoses")
        
        defaults.set(lost + 1, forKey: "mediumLoses") //Adds 1 to the loses in medium mode
    }
    
    
    func hardWins(){
        let defaults = UserDefaults.standard // Saves the data (Persistance)
        
        let wins = defaults.integer(forKey: "hardWins")
        
        defaults.set(wins + 1, forKey: "hardWins") //Adds 1 to the wins in easy mode
    }
    func hardLoses(){
        let defaults = UserDefaults.standard // Saves the data (Persistance)
        
        let lost = defaults.integer(forKey: "hardLoses")
        
        defaults.set(lost + 1, forKey: "hardLoses") //Adds 1 to the loses in hard mode
    }
    
    // Creates vaiables that allows extra information in the game and sets different aspecs (difficulty, Selecting the random number, and "deciding" how many guesses will be alloted
    var usedCounter: Int = 0
    var passedData: (difficulty: Int, randomNumber: Int, counter: Int) = (0,0,0)
    let userDefaults = UserDefaults.standard

    // This override functions allows the screen to load up before the user sees it.
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenRange.text = String("Guess a number from 0 to \(passedData.difficulty)") // Tells the used what range to guess from
        guessesRemaining.text = ("Guesses Remaining: \(passedData.counter)") // Tells the user how many guesses they will recieve.
        playAgain.isHidden = true
        congratulationsKey.isHidden = true
        quitScreen.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButton(_ sender: Any) { // This will tell the computer to check the Users input and see how it should respond to the number it was given.
            if Int(usersGuess.text!) != nil { // This will verify that the number was in fact a number.
                if Int(usersGuess.text!)! > passedData.difficulty || Int(usersGuess.text!)! < 0 { // This checkes to make sure the number was inside of the given range.
                    InfoButton.text = ("Please choose a number inside the current range.")
                } else if Int(usersGuess.text!) == passedData.randomNumber { // This will check to see if the users number is in fact the number that was randomly chosen at in the ViewController file.
                    print(usersGuess, passedData.randomNumber)
                    
                    if passedData.difficulty == 50 {
                        easyWins()
                    }else if passedData.difficulty == 100 {
                        mediumWins()
                    }else if passedData.difficulty == 200 {
                        hardWins()
                    }
                    
                    self.InfoButton.text = ("You guessed it Congratulations!")
                    self.stackView.isHidden = true
                    self.congratulationsKey.isHidden = false
                    
                    let sleepFor: UInt64 = 2 * 1_000_000_000
                    
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: DispatchTime.now().uptimeNanoseconds + sleepFor)) { // sleeps for  2 seconds
                        self.congratulationsKey.isHidden = true
                        self.playAgain.isHidden = false // Makes an option appear for the user to play again
                        self.quitScreen.isHidden = false
                    }
                    
                }else if Int(usersGuess.text!)! < passedData.randomNumber &&  passedData.counter > 1{ // Checks to see if the number you chose is lower than the random number.
                    InfoButton.text = ("Nope, thats too low.")
                    passedData.counter -= 1 // Takes one away from the the Users remaining guesses
                    guessesRemaining.text = ("Guesses Remianing: \( passedData.counter)")
                    usedCounter += 1 // Adds one to the amount of guesses the user has used
                    guessesUsed.text = ("Guesses Used: \(usedCounter)")
                    usersGuess.text = ("") // Sets the user input back to nothing so that the user doesnt have to press bak on their previous guess
                    
                }else if Int(usersGuess.text!)! > passedData.randomNumber &&  passedData.counter > 1{// Checks to see if the number you chose is higher than the random number.
                    InfoButton.text = ("Nope, thats too high")
                    passedData.counter -= 1 // Takes one away from the the Users remaining guesses
                    guessesRemaining.text = ("Guesses Remaining: \( passedData.counter)")
                    usedCounter += 1 // adds one to the amount of guesses the user has used
                    guessesUsed.text = ("Guesses Used: \(usedCounter)")
                    usersGuess.text = ("") // Sets the user input back to nothing so that the user doesnt have to press bak on their previous guess
                    
                }else{ // When the user runs out of guesses the text becomes 0 and it prints the text below...
                    if passedData.difficulty == 50 {
                        easyLoses()
                    }else if passedData.difficulty == 100 {
                        mediumLoses()
                    }else if passedData.difficulty == 200 {
                        hardLoses()
                    }
                    
                    let sleepFor: UInt64 = 4 * 1_000_000_000
                    
                    guessesRemaining.text = "Guesses Remaining: 0"
                    usersGuess.text = ("")
                    InfoButton.text = ("I'm sorry, the correct number was \(self.passedData.randomNumber).")
                    
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: DispatchTime.now().uptimeNanoseconds + sleepFor)) { // sleeps for  3 second
                        self.stackView.isHidden = true
                        self.playAgain.isHidden = false
                        self.quitScreen.isHidden = false
                    }

                }
            }else{
                InfoButton.text = ("Please enter number.")
            }
    }





}
