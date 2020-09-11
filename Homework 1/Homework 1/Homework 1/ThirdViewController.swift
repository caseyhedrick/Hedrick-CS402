//
//  ThirdViewController.swift
//  Homework 1
//
//  Created by user181417 on 9/10/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var progressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        progressSlider.value = 0
        
    }
    
   

    @IBAction func drillFinishedTapped(_ sender: Any) {
        progressSlider.value = progressSlider.value+0.2
        
       if progressSlider.value == 1 {
            progressLabel.text = "You Did it!"
        }
        if progressSlider.value < 0.2 {
            progressLabel.text = "5 More Left!"
        }
        if progressSlider.value == 0.2 && progressSlider.value < 0.4 {
        progressLabel.text = "4 More Left!"
       }
        if progressSlider.value == 0.4 && progressSlider.value < 0.6 {
        progressLabel.text = "3 More Left!"
        }
        if progressSlider.value == 0.6 && progressSlider.value < 0.8 {
        progressLabel.text = "2 More Left!"
        }
        if progressSlider.value == 0.8 && progressSlider.value < 1.0 {
               progressLabel.text = "1 More Left!"
               }
    }
}

