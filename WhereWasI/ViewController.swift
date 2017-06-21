//
//  ViewController.swift
//  WhereWasI
//
//  Created by Gustavo Colaco on 21/06/17.
//  Copyright © 2017 Gustavo Colaço. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        if let oldCoords = DataStore().GetLastLocation(){
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(oldCoords.latitude)!
            annotation.coordinate.longitude = Double(oldCoords.longitude)!
            
            annotation.title = "I was here"
            annotation.subtitle = "Remember?"
            mapView.addAnnotation(annotation)
            
        }
        
        
    }
    
    @IBAction func SaveButtonClicked(_ sender: Any) {
        let coord = locationManager.location?.coordinate
        
        if let lat = coord?.latitude {
            if let long = coord?.longitude{
                DataStore().StoreDataPoint(latitude: String(lat), longitude: String(long))
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            print("location not enabled")
            return
        }
        
        print("location allowed")
        mapView.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}








