//
//  FindMyFieldController.swift
//  FindMyField(FinalProject)
//
//  Created by user181417 on 12/11/20.
//

import UIKit
import CoreData


class FindMyFieldController: NSObject {
    
    
    static var fieldListArray = Array<Field>()
    
    class func fetchData(){
       let managedObjectContext = DatabaseController.getContext()
        
        let fetchRequest:NSFetchRequest = Field.fetchRequest()
        
        do {
            let fetchResults = try managedObjectContext.fetch(fetchRequest)
            
            if(fetchResults.count > 0) {
                FindMyFieldController.fieldListArray = fetchResults
                NotificationCenter.default.post(Notification (name: Notification.Name("NEW_FIELD")))            }
        }
        catch{
            print(exception.self)
        }
        
    }
    
    class func addField(newField:Field){
        FindMyFieldController.fieldListArray.append(newField)
        DatabaseController.saveContext()
        
        
    }
    class func createField(newfieldAgeGroup:String, newfieldName:String, newfieldType:String, newLatitude:Double, newLongitude:Double, shouldSaveToDB:Bool){
        let field:Field = Field(context: DatabaseController.getContext())
        
        
    
        

        field.fieldName = newfieldName
        field.fieldAgeGroup = newfieldAgeGroup
        field.fieldType = newfieldType
        field.location = Location(context: DatabaseController.getContext())
        field.location?.latitude = newLatitude
        field.location?.longitude = newLongitude
        
        
        
        
        
        
        
        FindMyFieldController.addField(newField: field)
        
        DatabaseController.saveContext()
        
        NotificationCenter.default.post(Notification (name: Notification.Name("NEW FIELD")))
    }
    class func fieldList() -> Array<Field>{
        return FindMyFieldController.fieldListArray
    }
}
