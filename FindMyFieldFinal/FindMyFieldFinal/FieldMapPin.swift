//
//  FieldMapPin.swift
//  FindMyFieldFinal
//
//  Created by user181417 on 12/12/20.
//

import UIKit
import MapKit


class FieldMapPin: NSObject, MKAnnotation {

    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D

    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

