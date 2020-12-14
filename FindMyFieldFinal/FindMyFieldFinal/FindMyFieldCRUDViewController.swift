//
//  FindMyFieldCRUDViewController.swift
//  FindMyField(FinalProject)
//
//  Created by user181417 on 12/10/20.
//

import UIKit
import CoreData

class FindMyFieldCRUDViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate
{
    
    let imagePickerController = UIImagePickerController()
    private let pickerViewDataSource = ["Baseball", "Basketball", "Football", "Soccer", "Softball", "Other"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerViewDataSource.count
    }
    
        
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewDataSource[row]
        
    }
    
    
    
    
    @IBOutlet weak var fieldImage: UIImageView!
    
    
    @IBOutlet weak var fieldNameTextField: UITextField!
    
    
    @IBOutlet weak var fieldTypePickerView: UIPickerView!
    
    
    @IBOutlet weak var ageGroupTextField: UITextField!
    
    
    

    
    
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        

        fieldTypePickerView.dataSource = self
        fieldTypePickerView.delegate = self
        
    
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
    }
    
    
    
    @IBAction func saveTapped(_ sender: Any) {
        let currentLocation = LocationController.currentLocation
        FindMyFieldController.createField(newfieldAgeGroup: ageGroupTextField.text!, newfieldName: fieldNameTextField.text!, newfieldType: (pickerViewDataSource.description),  newLatitude: (currentLocation?.coordinate.latitude)! as Double,
                                          newLongitude: (currentLocation?.coordinate.longitude)! as Double, shouldSaveToDB:false)
        
        
        
    
                navigationController?.popViewController(animated: true)
        
        
        
    }
   
   

}
