//
//  WebServices.swift
//  FindMyFieldFinal
//
//  Created by user181417 on 12/11/20.
//

import UIKit
import Alamofire

class WebServices: NSObject {
    
        static let NAME_KEY = "name"
        static let FIELDTYPE_KEY = "field type"
        static let AGEGROUP_KEY = "age group"
        static let FIELDIMAGE_KEY = "field image"
        static let LOCATION_KEY = "location"
        
    
    class func loadFields(){
        let requestString = "http://localhost:3000/"
        let url = URL(string: requestString)
        let urlRequest = URLRequest(url: url!)
        
        
        AF.request(urlRequest).responseJSON {
                    (jsonResponse) in
                    switch(jsonResponse.result){
                        case let .success(success):
                            print(success)
                            if( jsonResponse.response!.statusCode / 100 == 2){
                                let findMyFieldArray = success as! Array<Dictionary<AnyHashable, Any>>


                                for(_, jsonObject) in findMyFieldArray.enumerated(){
                                    let fields:Dictionary = jsonObject as! Dictionary<String, AnyObject>
                                    print(fields)
                                    let fieldNameString:String = fields[NAME_KEY] as! String
                                    let fieldTypeString:String = fields[FIELDTYPE_KEY] as! String
                                    let ageGroupString:String = fields[AGEGROUP_KEY] as! String
                                 //   let fieldImageString:String = fields[FIELDIMAGE_KEY] as! String
                                    let locationObject = fields[LOCATION_KEY] as! Dictionary<AnyHashable, Any>
                                   // let locationObject = field[LOCATION_KEY] as! Dictionary<AnyHashable, Any>

                                //    FindMyFieldController.createField(newName: nameString, newDescription: descriptionString, newCategory: "", newLatitude: locationObject["latitude"] as! Double, newLongitude: locationObject["longitude"] as! Double, shouldSaveToDB: false)
                                    
                                    FindMyFieldController.createField(newfieldAgeGroup: ageGroupString, newfieldName: fieldNameString, newfieldType: fieldTypeString, newLatitude: locationObject["latitude"] as! Double, newLongitude: locationObject["longitiude"] as! Double, shouldSaveToDB: true)
                                }
                            }

                        case let .failure(error):
                            NotificationCenter.default.post(name: Notification.Name("LOAD_FAILURE"), object: error)
                    }
                }
            }
    

}
