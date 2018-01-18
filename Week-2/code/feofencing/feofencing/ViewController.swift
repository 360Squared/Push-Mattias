//
//  ViewController.swift
//  feofencing
//
//  Created by Mattias te Wierik on 22-11-17.
//  Copyright © 2017 Mattias te Wierik. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager() // Add this statement
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // bind the delegate
        locationManager.delegate = self
        
        // Ask for permissions, for now a decent solution. In a real app you will handle this on a more nice way.
        locationManager.requestAlwaysAuthorization()
        
        //loadAllGeotifications()
        startMonitoring()
    }

    func startMonitoring() {
        // 1
        if !CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            //showAlert(withTitle:"Error", message: "Geofencing is not supported on this device!")
            return
        }
        // 2
        if CLLocationManager.authorizationStatus() != .authorizedAlways {
            /*showAlert(withTitle:"Warning", message: "Your geotification is saved but will only be activated once you grant Geotify permission to access the device location.")*/
        }
        
        let coordinate = CLLocationCoordinate2DMake(51.988191, 5.950372)
        
        let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude), radius: 30.0, identifier: "HAN")
        locationManager.startMonitoring(for: region)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //mapView.showsUserLocation = (status == .authorizedAlways)
    }
}
