//
//  GeocacheController.swift
//  ScavengerHunt
//
//  Created by user181417 on 11/18/20.
//

import UIKit
import CoreData

class GeocacheController: NSObject {
    
    static var geocacheArray = Array<GeoCache>()
    
    class func fetchData(){
     let managedObjectContext =   DatabaseController.getContext()
        
        let fetchReuest:NSFetchRequest = GeoCache.fetchRequest()
        do{
        let fetchResults =  try managedObjectContext.fetch(fetchReuest)
        
            if (fetchResults.count > 0){
                GeocacheController.geocacheArray.append(contentsOf: fetchResults)
                NotificationCenter.default.post(Notification(name: Notification.Name("NEW_GEOCACHE")))            }
        }
        catch{
            print(exception.self)
        }
        
    }
    
   class func addGeoCache(newGeoCache:GeoCache){
        self.geocacheArray.append(newGeoCache)
        
    }
    
    class func createGeoCache(newName:String, newDescription:String, newCategory:String, newLatitude:Double, newLongitude:Double){
        let geocache = GeoCache(context: DatabaseController.getContext())
        
        geocache.geocacheName = newName
        geocache.geocacheDescription = newDescription
        geocache.geocacheCategory = newCategory
        
        geocache.location = Location(context: DatabaseController.getContext())
        geocache.location?.latitude = newLatitude
        geocache.location?.longitude = newLongitude
        
        
        GeocacheController.addGeoCache(newGeoCache: geocache)
        
        DatabaseController.saveContext()
        
        NotificationCenter.default.post(Notification(name: Notification.Name("NEW_GEOCACHE")))
    }
    class func geocacheList() -> Array<GeoCache>{
        return geocacheArray
    }
    
}
