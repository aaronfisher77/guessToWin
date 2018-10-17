//
//  HowToPlayVC.swift
//  guessToWin
//
//  Created by Aaron Fisher on 10/16/18.
//  Copyright © 2018 Aaron Fisher. All rights reserved.
//

import UIKit

class HowToPlayVC: UIViewController {

    @IBAction func BackToTitleScreen(_ sender: Any) {
        performSegue(withIdentifier: "BackToTitleScreen", sender: self)
    }
    
}
