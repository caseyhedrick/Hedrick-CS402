//
//  FirstViewController.swift
//  MiniApps
//
//  Created by user181417 on 9/3/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func concatTapped(_ sender: Any) {
 //       guard //firstNameTextField.text!.isEmpty else {
  //          return
  //      }
        let concatenatedString =  "Hello \(firstNameTextField.text!) \(lastNameTextField.text!), nice to meet you!"
//        print(firstNameTextField.text)
        
        outputLabel.text = concatenatedString
        
    }
 //I make code change.
}

