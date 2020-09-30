//
//  GuessManager.swift
//  Homework Example
//
//  Created by user181417 on 9/16/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import Foundation

class GuessManager: NSObject{
    var secretNumber:Int = 0
    
    var secretNumbers:[Int] = Array ()
    var guesses:[Int] = Array ()
    
    override init() {
        secretNumber = 15
    }
    func checkGuess ( guess:Int) -> Bool{
        return false
    }
}
