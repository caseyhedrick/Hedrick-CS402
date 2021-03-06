//
//  ViewController.swift
//  Maps Practice
//
//  Created by user181417 on 10/13/20.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
   
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePickerController = UIImagePickerController()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.distanceFilter = 40 //once the user has moved more than 40 meters, then update
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        let myHouse = CLLocationCoordinate2D(latitude: 50.846557, longitude: 4.351697)
        let geofenceRegion = CLCircularRegion(center: myHouse, radius: 100.0 * 1000.0, identifier: "Brussels")
        locationManager.startMonitoring(for: geofenceRegion)
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("ENTERED")
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.first{
        //    print(currentLocation.coordinate)
            let mapRegion = MKCoordinateRegion(center: currentLocation.coordinate, span: MKCoordinateSpan (latitudeDelta: 0.001, longitudeDelta: 0.001))
            
            mapView.setRegion(mapRegion, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alertController  = UIAlertController(title: "Choose a profile photo", message: "Choose from your library or camera to select a profile photo to use in your new account", preferredStyle: .actionSheet)
        
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

