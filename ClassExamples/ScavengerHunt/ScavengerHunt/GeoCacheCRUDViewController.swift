//
//  GeoCacheCRUDViewController.swift
//  ScavengerHunt
//
//  Created by user181417 on 11/17/20.
//

import UIKit
import CoreData

class GeoCacheCRUDViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    @IBOutlet weak var categoryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTouched(_ sender: Any) {
        let currentLocation = LocationController.currentLocation
        
        
        GeocacheController.createGeoCache(newName: nameTextField.text!, newDescription: descriptionTextField.text!, newCategory: categoryTextField!.text!, newLatitude: (currentLocation?.coordinate.latitude)! as Double, newLongitude: (currentLocation?.coordinate.longitude)! as Double)
        
        
        
        
        
        
        
        
        navigationController?.popViewController(animated: true)
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
