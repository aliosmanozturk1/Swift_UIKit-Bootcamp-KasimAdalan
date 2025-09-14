//
//  ViewController.swift
//  P23_LokasyonKullanimi
//
//  Created by Ali Osman Öztürk on 14.09.2025.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    @IBOutlet weak var labelHiz: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
//        let konum = CLLocationCoordinate2D(latitude: 41.0153901, longitude: 28.9724295)
//        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//        let bolge = MKCoordinateRegion(center: konum, span: span)
//        mapView.setRegion(bolge, animated: true)
//        
//        let pin = MKPointAnnotation()
//        pin.coordinate = konum
//        pin.title = "Eminönü"
//        pin.subtitle = "Meydanı"
//        mapView.addAnnotation(pin)

    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum = locations.last!
        
        let enlem = sonKonum.coordinate.latitude
        let boylam = sonKonum.coordinate.longitude
        
        labelEnlem.text = "Enlem: \(enlem)"
        labelBoylam.text = "Boylam: \(boylam)"
        labelHiz.text = "Hız: \(sonKonum.speed)"
        
        let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(bolge, animated: true)

//        let pin = MKPointAnnotation()
//        pin.coordinate = konum
//        pin.title = "\(enlem) - \(boylam)"
//        pin.subtitle = "Konum"
//        mapView.addAnnotation(pin)
        
        mapView.showsUserLocation = true
    }
}
