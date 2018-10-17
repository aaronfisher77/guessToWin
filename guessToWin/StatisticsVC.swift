//
//  StatisticsVC.swift
//  guessToWin
//
//  Created by Aaron Fisher on 10/16/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class StatisticsVC: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var easyWins: UILabel!
    @IBOutlet weak var easyLoses: UILabel!
    @IBOutlet weak var mediumWins: UILabel!
    @IBOutlet weak var mediumLoses: UILabel!
    @IBOutlet weak var hardWins: UILabel!
    @IBOutlet weak var hardLoses: UILabel!
    
    @IBAction func BackToTitleScreen(_ sender: Any) {
        performSegue(withIdentifier: "BackToTitleScreen", sender: self)
    }
    
    
    override func viewDidLoad() {
        
        let easyW = defaults.integer(forKey: "easyWins")
        let easyL = defaults.integer(forKey: "easyLoses")
        let mediumW = defaults.integer(forKey: "mediumWins")
        let mediumL = defaults.integer(forKey: "mediumLoses")
        let hardW = defaults.integer(forKey: "hardWins")
        let hardL = defaults.integer(forKey: "hardLoses")
        
        easyWins.text = "Wins: \(easyW)"
        easyLoses.text = "Loses: \(easyL)"
        mediumWins.text = "Wins: \(mediumW)"
        mediumLoses.text = "Loses: \(mediumL)"
        hardWins.text = "Wins: \(hardW)"
        hardLoses.text = "Loses: \(hardL)"

    }

    @IBAction func ResetButton(_ sender: Any) {
        defaults.set(0, forKey: "easyWins")
        defaults.set(0, forKey: "easyLoses")
        defaults.set(0, forKey: "mediumWins")
        defaults.set(0, forKey: "mediumLoses")
        defaults.set(0, forKey: "hardWins")
        defaults.set(0, forKey: "hardLoses")
        
        easyWins.text = "Wins: 0"
        easyLoses.text = "Loses: 0"
        mediumWins.text = "Wins: 0"
        mediumLoses.text = "Loses: 0"
        hardWins.text = "Wins: 0"
        hardLoses.text = "Loses: 0"
    }
    
}
