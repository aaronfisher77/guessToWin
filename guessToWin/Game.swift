//
//  Game.swift
//  guessToWin
//
//  Created by Aaron Fisher on 10/10/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class Game: UIViewController {
    
    //@IBOutlet weak var dataLabel: UILabel!
    var passedData: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = passedData {
            dataLabel.text = String(data)
        }
        // Do any additional setup after loading the view.
    }
}
