//
//  MapViewController.swift
//  SummerSessionApp
//
//  Created by Samar Seth on 10/27/19.
//  Copyright © 2019 Samar Seth. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    // copied from: https://www.codementor.io/@muneebali/mapkit-user-current-location-10xdbyy1v3
    // I am unsure what the `fileprivate` means
    fileprivate let locationManager: CLLocationManager = {
       let manager = CLLocationManager()
       manager.requestWhenInUseAuthorization()
       return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up the map view
        mapView.delegate = self // needed for pop-up window
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.showsScale = true
        currentLocation()
        mapView.mapType = MKMapType.hybrid
        
        // Long list of marked locations on the map (goes till end of viewDidLoad() function)
        // "addAnnotation()" places the pin at "coordinate"
        let commons = Marker(title: "Paresky Commons",
          locationName: "Phillips Academy",
          discipline: "Food",
          coordinate: CLLocationCoordinate2D(latitude: 42.646864, longitude: -71.130925))
        mapView.addAnnotation(commons)
        
        let library = Marker(title: "Oliver Wendell Holmes Library",
          locationName: "Phillips Academy",
          discipline: "Library",
          coordinate: CLLocationCoordinate2D(latitude: 42.647186, longitude: -71.132308))
        mapView.addAnnotation(library)
        
        let morseHall = Marker(title: "Morse Hall",
          locationName: "Phillips Academy",
          discipline: "Math",
          coordinate: CLLocationCoordinate2D(latitude: 42.647612, longitude: -71.131056))
        mapView.addAnnotation(morseHall)
        
        let gelb = Marker(title: "Gelb Science Center",
          locationName: "Phillips Academy",
          discipline: "Science",
          coordinate: CLLocationCoordinate2D(latitude: 42.647666, longitude: -71.129755))
        mapView.addAnnotation(gelb)
        
        let sykes = Marker(title: "Sykes Wellness Center",
          locationName: "Phillips Academy",
          discipline: "Health",
          coordinate: CLLocationCoordinate2D(latitude: 42.646280, longitude: -71.130659))
        mapView.addAnnotation(sykes)
        
        let bullfinch = Marker(title: "Bullfinch", locationName: "Phillips Academy", discipline: "English", coordinate: CLLocationCoordinate2D(latitude: 42.645891, longitude: -71.131063))
        mapView.addAnnotation(bullfinch)
        
        let gym = Marker(title: "Borden and Memorial Gym", locationName: "Phillips Academy", discipline: "Physical Education", coordinate: CLLocationCoordinate2D(latitude: 42.645157, longitude: -71.131278))
        mapView.addAnnotation(gym)
        
        let admissionCenter = Marker(title: "Shuman Admissions Center", locationName: "Phillips Academy", discipline: "Admissions", coordinate: CLLocationCoordinate2D(latitude: 42.646198, longitude: -71.131722))
        mapView.addAnnotation(admissionCenter)
        
        let smithCenter = Marker(title: "Smith Center", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.644778, longitude: -71.130363))
        mapView.addAnnotation(smithCenter)
        
        let cage = Marker(title: "Case Memorial Cage", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.644532, longitude: -71.130809))
        mapView.addAnnotation(cage)
        
        let baseballField = Marker(title: "Phelps Park", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.645673, longitude: -71.129547))
        mapView.addAnnotation(baseballField)
        
        let tennisCourts = Marker(title: "Tennis Courts", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.644606, longitude: -71.128685))
        mapView.addAnnotation(tennisCourts)
        
        let track = Marker(title: "Sorota Track Complex", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.643431, longitude: -71.126833))
        mapView.addAnnotation(track)
        
        let stadium = Marker(title: "Phelps Stadium", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.642862, longitude: -71.128745))
        mapView.addAnnotation(stadium)
        
        let snyder = Marker(title: "Snyder Center", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.643666, longitude: -71.128824))
        mapView.addAnnotation(snyder)
        
        let iceRink = Marker(title: "Ice Rink", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.641883, longitude: -71.129472))
        mapView.addAnnotation(iceRink)
        
        let siberia = Marker(title: "Siberia", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.640406, longitude: -71.127583))
        mapView.addAnnotation(siberia)
        
        let samPhil = Marker(title: "Samuel Phillips Hall", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.648348, longitude: -71.131284))
        mapView.addAnnotation(samPhil)
        
        let gw = Marker(title: "George Washington Hall", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.648879, longitude: -71.132252))
        mapView.addAnnotation(gw)
        
        let elson = Marker(title: "Elson Art Center", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.648970, longitude: -71.132978))
        mapView.addAnnotation(elson)
        
        let addison = Marker(title: "Addison Gallery of American Art", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.648630, longitude: -71.133088))
        mapView.addAnnotation(addison)
        
        let chapel = Marker(title: "Cochran Chapel", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.649310, longitude: -71.134517))
        mapView.addAnnotation(chapel)
        
        let graves = Marker(title: "Graves Hall", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.648466, longitude: -71.136526))
        mapView.addAnnotation(graves)
        
        let gravesField = Marker(title: "Graves Field", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.648138, longitude: -71.137310))
        mapView.addAnnotation(gravesField)
        
        let sanctuary = Marker(title: "Moncrief M. Cochran Sanctuary", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.650691, longitude: -71.130449))
        mapView.addAnnotation(sanctuary)
        
        let pearson = Marker(title: "Pearson Hall", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.647416, longitude: -71.131524))
        mapView.addAnnotation(pearson)
        
        let peabody = Marker(title: "Robert S. Peabody Institute of Archaeology", locationName: "Phillips Academy", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.647686, longitude: -71.135246))
        mapView.addAnnotation(peabody)
        
        // Dorms
        // Flagstaff
        let dayHall = Marker(title: "Day Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.647007, longitude: -71.131764))
        mapView.addAnnotation(dayHall)
        
        let paulRevere = Marker(title: "Paul Revere Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.647433, longitude: -71.130449))
        mapView.addAnnotation(paulRevere)
        
        let bartlet = Marker(title: "Bartlet Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.647641, longitude: -71.132137))
        mapView.addAnnotation(bartlet)
        
        let foxcroft = Marker(title: "Foxcroft Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.648319, longitude: -71.132549))
        mapView.addAnnotation(foxcroft)
        
        let smith = Marker(title: "Smith House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.646790, longitude: -71.129369))
        mapView.addAnnotation(smith)
        
        let burtt = Marker(title: "Burtt House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.646653, longitude: -71.129060))
        mapView.addAnnotation(burtt)
        
        let newman = Marker(title: "Newman House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.646139, longitude: -71.131900))
        mapView.addAnnotation(newman)
        
        // PKN
        let stuart = Marker(title: "Stuart Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.649157, longitude: -71.129488))
        mapView.addAnnotation(stuart)
        
        let fuess = Marker(title: "Fuess Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.650225, longitude: -71.129527))
        mapView.addAnnotation(fuess)
        
        let hale = Marker(title: "Nathan Hale House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.651062, longitude: -71.130781))
        mapView.addAnnotation(hale)
        
        let stimson = Marker(title: "Stimson House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.649716, longitude: -71.130209))
        mapView.addAnnotation(stimson)
        
        let stevens = Marker(title: "Stevens House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.649780, longitude: -71.131474))
        mapView.addAnnotation(stevens)
        
        // WQS
        let adams = Marker(title: "Adams Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.644612, longitude: -71.133773))
        mapView.addAnnotation(adams)
        
        let taylor = Marker(title: "Taylor Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.644127, longitude: -71.134072))
        mapView.addAnnotation(taylor)
        
        let johnson = Marker(title: "Johnson Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.644238, longitude: -71.134807))
        mapView.addAnnotation(johnson)
        
        let thompson = Marker(title: "Thompson House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.643081, longitude: -71.134404))
        mapView.addAnnotation(thompson)
        
        let tucker = Marker(title: "Jewett-Tucker House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.643444, longitude: -71.134080))
        mapView.addAnnotation(tucker)
        
        let blanchard = Marker(title: "Blanchard House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.643743, longitude: -71.133665))
        mapView.addAnnotation(blanchard)
        
        // WQN
        let bishop = Marker(title: "Bishop Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.645343, longitude: -71.134229))
        mapView.addAnnotation(bishop)
        
        let rockwell = Marker(title: "Rockwell Hall", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.644974, longitude: -71.135300))
        mapView.addAnnotation(rockwell)
        
        let isham = Marker(title: "Isham Dormitory", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.644949, longitude: -71.136426))
        mapView.addAnnotation(isham)
        
        let bancroft = Marker(title: "Isham Dormitory", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.645500, longitude: -71.134989))
        mapView.addAnnotation(bancroft)
        
        let pemberton = Marker(title: "Pemberton Cottage", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.645484, longitude: -71.136800))
        mapView.addAnnotation(pemberton)
        
        let eaton = Marker(title: "Eaton Cottage", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.645726, longitude: -71.136917))
        mapView.addAnnotation(eaton)
        
        let andoverCottage = Marker(title: "Andover Cottage", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.646062, longitude: -71.137067))
        mapView.addAnnotation(andoverCottage)
        
        let pease = Marker(title: "Pease House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.646261, longitude: -71.134238))
        mapView.addAnnotation(pease)
        
        // Abbot
        let carriage = Marker(title: "Williams Hall Carriage House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.647760, longitude: -71.139228))
        mapView.addAnnotation(carriage)
        
        let doubleBrick = Marker(title: "Double Brick House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.648201, longitude: -71.136682))
        mapView.addAnnotation(doubleBrick)
        
        let samaritan = Marker(title: "Samaritan House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.649104, longitude: -71.135585))
        mapView.addAnnotation(samaritan)
        
        let stearns = Marker(title: "Stearns House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.649725, longitude: -71.132502))
        mapView.addAnnotation(stearns)
        
        let stowe = Marker(title: "Stowe House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.650002, longitude: -71.134074))
        mapView.addAnnotation(stowe)
        
        let frenchHouse = Marker(title: "French House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.649949, longitude: -71.134827))
        mapView.addAnnotation(frenchHouse)
        
        let whitney = Marker(title: "Whitney House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.650256, longitude: -71.135001))
        mapView.addAnnotation(whitney)
        
        let carter = Marker(title: "Carter House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.650018, longitude: -71.136456))
        mapView.addAnnotation(carter)
        
        let clement = Marker(title: "Clement House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.649701, longitude: -71.137172))
        mapView.addAnnotation(clement)
        
        let draper = Marker(title: "Draper Cottage", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.650510, longitude: -71.136824))
        mapView.addAnnotation(draper)
        
        let aHouse = Marker(title: "America House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.649278, longitude: -71.137872))
        mapView.addAnnotation(aHouse)
        
        let alumni = Marker(title: "Alumni House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.650133, longitude: -71.137803))
        mapView.addAnnotation(alumni)
        
        let bertha = Marker(title: "Bertha Bailey House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.650364, longitude: -71.138085))
        mapView.addAnnotation(bertha)
        
        let flagg = Marker(title: "Flagg House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.650592, longitude: -71.138422))
        mapView.addAnnotation(flagg)
        
        let morton = Marker(title: "Morton House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.651091, longitude: -71.138209))
        mapView.addAnnotation(morton)
        
        // I don't know the cluster
        let allen = Marker(title: "Allen House", locationName: "Phillips Academy Dorm", discipline: "None", coordinate: CLLocationCoordinate2D(latitude: 42.643618, longitude: -71.131051))
        mapView.addAnnotation(allen)
    }

    // below functions copied from: https://www.codementor.io/@muneebali/mapkit-user-current-location-10xdbyy1v3
    // used to get the current locatio
    func currentLocation() {
       locationManager.delegate = self
       locationManager.desiredAccuracy = kCLLocationAccuracyBest
       if #available(iOS 11.0, *) {
          locationManager.showsBackgroundLocationIndicator = true
       } else {
          // Fallback on earlier versions
       }
       locationManager.startUpdatingLocation()
    }
    
    // takes current location or last known current location and centers the mapView there
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       let location = locations.last! as CLLocation
       let currentLocation = location.coordinate
       let coordinateRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 800, longitudinalMeters: 800)
       mapView.setRegion(coordinateRegion, animated: true)
       locationManager.stopUpdatingLocation()
    }
    
    // Error handler
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       print(error.localizedDescription)
    }
}

// copied from https://www.raywenderlich.com/548-mapkit-tutorial-getting-started#toc-anchor-011
// necessary for the pop up view when you click on the marker
extension MapViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    // if the annotation on the map is not a location marker of the type "Marker" this function will not do anything
    // I left this in case I later want to have different types of markers for different types of buildings but it is not necessary right now since I only have one type of marker
    guard let annotation = annotation as? Marker else { return nil }
    let identifier = "marker"
    var view: MKMarkerAnnotationView

    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
      as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
    
    // if the "i" on the pop up is clicked, this will take you to the maps app and give you directions to that location
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {
      let location = view.annotation as! Marker
      let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
      location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}
