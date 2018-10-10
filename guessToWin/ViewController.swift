//
//  ViewController.swift
//  guessToWin
//
//  Created by Aaron Fisher on 10/9/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var difficulty = 0
    @IBAction func easy(_ sender: Any) {
        difficulty = 50
    }
    
    @IBAction func hard(_ sender: Any) {
        difficulty = 200
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
            vc?.passedData = difficulty
        }
    }
    
}

