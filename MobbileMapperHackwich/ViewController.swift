//
//  ViewController.swift
//  MobbileMapperHackwich
//
//  Created by Diego Gonzalez on 1/11/22.
//

import MapKit
import UIKit

class ViewController: UIViewController{
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.showsUserLocation = true
        locationManger.requestWhenInUseAuthorization()
    }
    @IBOutlet weak var mapView: MKMapView!
    
    
    

}

