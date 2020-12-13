//
//  FieldMapPinViewController.swift
//  FindMyFieldFinal
//
//  Created by user181417 on 12/12/20.
//

import UIKit
import MapKit

class FieldMapPinViewController: UIViewController {

   
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    fileprivate func addFieldPin(_ allAnnotations: [MKAnnotation], _ fields: [Field]) {
           self.mapView.removeAnnotations(allAnnotations)
           for field in fields {
               let coordinate = CLLocationCoordinate2DMake(field.location!.latitude as Double, field.location!.longitude as Double)

            let mapPin = FieldMapPin(title: field.fieldName!, subtitle: field.fieldType!, coordinate: coordinate)
            mapView.addAnnotation(mapPin)
            
            
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10, longitudinalMeters: 10)
            mapView.setRegion(region, animated: true)
            
           }
       }

       override func viewWillAppear(_ animated: Bool) {
        let fields = FindMyFieldController.fieldList()

           let allAnnotations = self.mapView.annotations
           addFieldPin(allAnnotations, fields)
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
