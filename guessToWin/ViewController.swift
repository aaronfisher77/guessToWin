//
//  ViewController.swift
//  guessToWin
//
//  Created by Aaron Fisher on 10/9/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var difficultyAndRandomNumberAndCounter = (difficulty: 0, randomNumber: 0, counter: 0) //Creates a tuple that will pass through the difficulty, random number, and counter.
    
    @IBAction func easy(_ sender: Any) { // This will set the requirements that will make easy...easy.
        difficultyAndRandomNumberAndCounter.difficulty = 50 // Sets difficulty
        difficultyAndRandomNumberAndCounter.randomNumber = Int.random(in: 0...50) // Sets random number 0 - 50
        difficultyAndRandomNumberAndCounter.counter = 10 // Sets number of guesses
    }
    
    @IBAction func medium(_ sender: Any) { // This will set the requirements that will make medium...medium.
        difficultyAndRandomNumberAndCounter.difficulty = 100 // Sets difficulty
        difficultyAndRandomNumberAndCounter.randomNumber = Int.random(in: 0...100) // Sets random number 0 - 100
        difficultyAndRandomNumberAndCounter.counter = 7 // Sets number of guesses
    }
    
    @IBAction func hard(_ sender: Any) { // This will set the requirements that will make hard...hard.
        difficultyAndRandomNumberAndCounter.difficulty = 200 // Sets difficulty
        difficultyAndRandomNumberAndCounter.randomNumber = Int.random(in: 0...200) // Sets random number 0 - 200
        difficultyAndRandomNumberAndCounter.counter = 5 // Sets number of guesses
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Game // Sets the destination of the information
        {
            let vc = segue.destination as? Game
            vc?.passedData = difficultyAndRandomNumberAndCounter
        }
    }
    
   
    
}

