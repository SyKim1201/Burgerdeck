//
//  MapViewController.swift
//  Final
//
//  Created by Brian Kim on 12/4/21.
//  View Controller for map

import UIKit
import MapKit

//Variable for currently selected location used globally
public var loc = ""

//Annotation class to mark each restaurant on the map with a pin
class Restaurant: NSObject, MKAnnotation {
    let title: String?
    let location: String?
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? {
        return location
    }
    
    init(title: String?, location: String?, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.location = location
        self.coordinate = coordinate
    }

}

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    //Connect outlets
    @IBOutlet weak var locLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    //Create location manager
    let locationManager = CLLocationManager()
    //Set coordinate for waterloo to center map
    let waterlooCoord = CLLocation(latitude: 43.466667, longitude: -80.516670)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Print currently selected location to label
        locLabel.text = loc
        
        //Set up map view and location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.isUserInteractionEnabled = true
        
        //Center map location to waterloo
        mapView.centerLocation(waterlooCoord)
        //Add annotations to map
        addAnnotations()
    }
    
    func addAnnotations() {
        //Create some restaurant locations around Kitchener and Waterloo
        let r1 = Restaurant(title: "BurgerDeck Waterloo 1", location: "Conestoga College Waterloo Campus", coordinate: CLLocationCoordinate2D(latitude: 43.479539, longitude: -80.5185342))
        let r2 = Restaurant(title: "BurgerDeck Waterloo 2", location: "University of Waterloo", coordinate: CLLocationCoordinate2D(latitude: 43.4722153, longitude: -80.5446859))
        let r3 = Restaurant(title: "BurgerDeck Waterloo 3", location: "Wilfred Laurier University", coordinate: CLLocationCoordinate2D(latitude: 43.4738198, longitude: -80.52741567))
        let r4 = Restaurant(title: "BurgerDeck Kitchener 1", location: "Conestoga College Kitchener-Doon Campus", coordinate: CLLocationCoordinate2D(latitude: 43.38984958, longitude: -80.40472515))
        let r5 = Restaurant(title: "BurgerDeck Kitchener 2", location: "GrandRiver Hospital", coordinate: CLLocationCoordinate2D(latitude: 43.45744706, longitude: -80.511971))
        
        //Add anotations
        mapView.addAnnotation(r1)
        mapView.addAnnotation(r2)
        mapView.addAnnotation(r3)
        mapView.addAnnotation(r4)
        mapView.addAnnotation(r5)
        
    }

    //Event annotation is selected
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        //Set currently chosen location to annotation loction
        loc = (view.annotation?.title)!!
        locLabel.text = loc
    }

}

private extension MKMapView {
    //Center map to given coordinate
    func centerLocation(_ location: CLLocation, radius: CLLocationDistance = 10000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        setRegion(coordinateRegion, animated: true)
    }
}
