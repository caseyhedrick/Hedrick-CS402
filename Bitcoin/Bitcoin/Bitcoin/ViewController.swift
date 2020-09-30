//
//  ViewController.swift
//  Bitcoin
//
//  Created by user181417 on 9/22/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON { (jsonResponse) in
            print(jsonResponse.result)
            
            switch(jsonResponse.result){
            case let .success(success):
                print(success)
                if (jsonResponse.response!.statusCode / 100 == 2) {
                    let bitcoinObject = success as! Dictionary<AnyHashable, Any>
                    
                    let bpiObject:Dictionary = bitcoinObject["bpi"] as! Dictionary<String, Any>
                    
                    let timeInfo:Dictionary = bitcoinObject["time"] as! Dictionary<String, Any>
                    let timeString:String = timeInfo["updated"] as! String
                    print(timeString)
                    
                    let usdObject:Dictionary = bpiObject["USD"] as! Dictionary<String, Any>
                    let rate = usdObject["rate_float"] as! Double
                    let rateString = String(format: "$.2f", rate)
      //              self.bitcoinLabel.text = "\(rateString)"
                    print(rateString)
                    self.priceLabel.text = rateString
                    
                    NotificationCenter.default.post(name: Notification.Name("BITCOIN_LOAD_SUCCESS"), object: rateString)
                }
                
                
            
            case let .failure(error):
                NotificationCenter.default.post(name: Notification.Name ("BITCOIN_LOAD_FAILURE"), object: error)
            default:
            print("Something else?")
        }
        
    }

    }
}

