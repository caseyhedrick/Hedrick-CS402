//
//  ViewController.swift
//  DataStorage
//
//  Created by user181417 on 10/8/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    let managedObjectContainer =  DatabaseController.managedObjectContainer()
        
        let chineseRestaurant = Restaurant(context: managedObjectContainer.viewContext)
        
        chineseRestaurant.restaurantName = "Name"
        
        let restaurantFetchRequest: NSFetchRequest = Restaurant.fetchRequest()
        let sortKey:String = "restaurantName"
        let sortDescriptor:NSSortDescriptor = NSSortDescriptor(key: sortKey, ascending: false)
        restaurantFetchRequest.sortDescriptors = [sortDescriptor]
        
        let  fetchPredicate:NSPredicate = NSPredicate(format: "restaurantName == %@", "Name")
        
        
        DatabaseController.saveContext()
        
           
            
 
    }
}


