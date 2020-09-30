//
//  GuessingGameViewController.swift
//  Homework Example
//
//  Created by user181417 on 9/16/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class GuessingGameViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var giveupButton: UIButton!
    
    @IBOutlet weak var guessButton: UIButton!
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var guessingTextField: UITextField!
    
    var   numberOfGuesses = 0
    
    let guessManager:GuessManager = GuessManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func guessNumberTapped(_ sender: Any) {
        let numberString = guessingTextField.text!
        let numberInt = Int(numberString)
        
        if (numberInt == guessManager.secretNumber){
            guessingTextField.resignFirstResponder() //hides keyboard
            winLabel.isHidden = false
            guessingTextField.isEnabled = false
        }
        else {
            numberOfGuesses += 1
            guessLabel.text = "You've guessed \(numberOfGuesses) times."
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
