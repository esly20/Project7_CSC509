//
//  Marker.swift
//  SummerSessionApp
//
//  Created by Samar Seth on 10/30/19.
//  Copyright © 2019 Samar Seth. All rights reserved.
//

// copied this class from https://www.raywenderlich.com/548-mapkit-tutorial-getting-started#toc-anchor-011
// creating an object of this class creates a pin that can be placed on the map at the specified coordinate with the title printed below it
import Foundation
import MapKit
import Contacts

class Marker: NSObject, MKAnnotation {
    // Variable declarations
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? {
        return locationName
    }
    
    // Initializer
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        super.init()
    }
    
    // Map item
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    
}
