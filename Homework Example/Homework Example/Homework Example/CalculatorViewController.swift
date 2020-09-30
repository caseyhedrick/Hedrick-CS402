//
//  CalculatorViewController.swift
//  Homework Example
//
//  Created by user181417 on 9/17/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func calcButtonTapped(_ sender: UIButton) {
        var displayValue:String = outputDisplay.text!
        let pressedValue = sender.tag
        
        let newCalculation = pressedValue
        displayValue.append(String(newCalculation))
        outputDisplay.text = displayValue
        
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
