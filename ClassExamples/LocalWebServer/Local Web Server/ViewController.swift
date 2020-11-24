//
//  ViewController.swift
//  Local Web Server
//
//  Created by user181417 on 11/10/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let localURL:URL = URL(string: "http://localhost:3000/")!
        AF.request(localURL).responseJSON { response in
            print(response)
        }
    }


}

