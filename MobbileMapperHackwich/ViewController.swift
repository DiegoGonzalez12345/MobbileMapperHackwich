//
//  ViewController.swift
//  MobbileMapperHackwich
//
//  Created by Diego Gonzalez on 1/11/22.
//

import MapKit
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate
{
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    class ViewController: UIViewController, CLLocationManagerDelegate { var currentLocation: CLLocation!}
    var parks: [MKMapItem] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
       locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
        {
        currentLocation = locations[0]
        }
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func whenZoomButtonPressed(_ sender: UIBarButtonItem)
    {
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let center = currentLocation.coordinate
        let region = MKCoordinateRegion(center: center, span: coordinateSpan)
        mapView.setRegion(region, animated: true)
        
    }
    
    @IBAction func whenSearchButtonPressed(_ sender: UIBarButtonItem)
    {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Parks"
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        request.region = MKCoordinateRegion(center: currentLocation!.coordinate, span: mapView.region.span)
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
        guard let response = response else { return }
        for mapItem in response.mapItems {
        self.parks.append(mapItem)
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.name
        self.mapView.addAnnotation(annotation)
        }
        }
        }
        
        
        
    }
    
    



