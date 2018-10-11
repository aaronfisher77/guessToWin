//
//  ViewController.swift
//  guessToWin
//
//  Created by Aaron Fisher on 10/9/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var difficultyAndRandomNumberAndCounter = (difficulty: 0, randomNumber: 0, counter: 0)
    
    @IBAction func easy(_ sender: Any) {
        difficultyAndRandomNumberAndCounter.difficulty = 50
        difficultyAndRandomNumberAndCounter.randomNumber = Int.random(in: 0...50)
        difficultyAndRandomNumberAndCounter.counter = 10
    }
    
    @IBAction func medium(_ sender: Any) {
        difficultyAndRandomNumberAndCounter.difficulty = 100
        difficultyAndRandomNumberAndCounter.randomNumber = Int.random(in: 0...100)
        difficultyAndRandomNumberAndCounter.counter = 7
    }
    
    @IBAction func hard(_ sender: Any) {
        difficultyAndRandomNumberAndCounter.difficulty = 200
        difficultyAndRandomNumberAndCounter.randomNumber = Int.random(in: 0...200)
        difficultyAndRandomNumberAndCounter.counter = 5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is Game
        {
            let vc = segue.destination as? Game
            vc?.passedData = difficultyAndRandomNumberAndCounter
        }
    }
    
   
    
}

