//
//  SecondViewController.swift
//  Homework 1
//
//  Created by user181417 on 9/9/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var OurTimer = Timer ()
    var TimerDisplayed = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func resetButtonTapped(_ sender: Any) {
        OurTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        OurTimer.invalidate()
    }
    @IBAction func resetButton(_ sender: Any) {
        OurTimer.invalidate()
        TimerDisplayed = 0
        timerLabel.text = "0"
    }
    @objc func Action(){
        TimerDisplayed += 1
        timerLabel.text = String(TimerDisplayed)
    }
}

