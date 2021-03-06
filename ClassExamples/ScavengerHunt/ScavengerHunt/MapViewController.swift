//
//  MapViewController.swift
//  ScavengerHunt
//
//  Created by user181417 on 11/19/20.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let geoCaches = GeocacheController.geocacheList()
        
        for geoCache in geoCaches {
            
            let coordinate = CLLocationCoordinate2DMake(geoCache.location!.latitude as Double, geoCache.location!.longitude as Double)
            
            let mapPin = GeoCacheMapPin(title: geoCache.geocacheName!, subtitle: geoCache.geocacheDescription!, coordinate: coordinate)
            
            mapView.addAnnotation(mapPin)
            
            
            
        }
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
