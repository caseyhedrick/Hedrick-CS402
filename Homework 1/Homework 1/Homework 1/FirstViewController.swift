//
//  FirstViewController.swift
//  Homework 1
//
//  Created by user181417 on 9/9/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
   
    @IBOutlet weak var concatLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func concatButtonTapped(_ sender: Any) {
        let concatenatedString = "Hello, \(firstNameTextField.text!) \(lastNameTextField.text!)!"
        concatLabel.text = concatenatedString
     
        }
    
    }


