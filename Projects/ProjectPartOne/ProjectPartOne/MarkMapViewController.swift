//
//  MarkMapViewController.swift
//  ProjectPartOne
//
//  Created by user181417 on 10/29/20.
//

import UIKit
import CoreLocation
import MapKit

class MarkMapViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate
{
     

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
   
    
    let imagePickerController = UIImagePickerController()
        
    let locationManager = CLLocationManager()
    
    private let pickerViewDataSource = ["Baseball", "Basketball", "Football", "Soccer", "Softball", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
    
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
            
    }
            
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let currentLocation = locations.first{
            print(currentLocation)
                let mapRegion = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan (latitudeDelta: 0.001, longitudeDelta: 0.001))
                
  
                mapView.setRegion(mapRegion, animated: true)
            
            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
            
                myAnnotation.coordinate = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude , longitude: currentLocation.coordinate.longitude)
                
                myAnnotation.title = "Current Field Location"
                
                mapView.addAnnotation(myAnnotation)
            }
        }
        
    
    
    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(title: "Please insert a picture of the field so other users can confirm this location", message: "Choose a photo from your library or camera to select a picture of this field", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (alertaction) in
            print("Library")
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "Camera", style: .destructive, handler: { (alertaction) in
            print("Camera")
            if (UIImagePickerController.isSourceTypeAvailable(.camera)){
                self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true, completion: nil)            }
                        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertaction) in
            print("Cancel")
        }))
        present(alertController, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[.editedImage] as! UIImage
        
        
        imageView.image = chosenImage
        
        dismiss(animated: true, completion: nil)
    }

   
   }


}
