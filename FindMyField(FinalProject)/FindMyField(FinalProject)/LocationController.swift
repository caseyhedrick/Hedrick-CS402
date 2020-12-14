//
//  LocationController.swift
//  FindMyField(FinalProject)
//
//  Created by user181417 on 12/10/20.
//

import UIKit
import CoreLocation

class LocationController: NSObject, CLLocationManagerDelegate {
    
    static let locationManager:CLLocationManager = CLLocationManager()
    static var currentLocation:CLLocation? = nil
    static var sharedLocationController:LocationController = LocationController()
    
    class func startGPS(){
        locationManager.delegate = sharedLocationController
        locationManager.distanceFilter = 100
        locationManager.desiredAccuracy = kCLLocationAccuracyReduced
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    class func stopGPS(){
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        LocationController.currentLocation = locations[0]
    }
    

}
