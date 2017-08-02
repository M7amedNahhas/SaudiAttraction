//
//  ViewController.swift
//  Saudi Attraction
//
//  Created by M7amedNahhas on 11/3/1438 AH.
//  Copyright © 1438 WadiMakkah. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import CoreLocation

class SMViewController: UIViewController,CLLocationManagerDelegate , UISearchBarDelegate {
   
    let manager = CLLocationManager()
    
    //Attraction List 
    let attraction: [SMAttraction] = [
        SMAttraction(name: "Makkah Mall", latitude: 21.390664 , longitude:39.883875, info: "open from 8AM to 12AM" ),
        SMAttraction(name: "AL-Haram", latitude: 21.422871, longitude: 39.825735, info: "all the time"),
        SMAttraction(name: "مسجد نصير", latitude: 21.399456, longitude: 39.781566, info: "in praier time"),
        SMAttraction(name: "al- hjaz mall", latitude: 21.423755, longitude: 39.782017, info: "from 8PM to 12AM")
    
    
    ]
    
    
    @IBOutlet weak var Segment: NLSegmentControl!
    
    

    @IBOutlet var searchBarMap: UISearchBar!
    
    
    
    
    
    
    @IBAction func currentLocationActionBT(_ sender: UIButton) {
        
        //manager.startUpdatingLocation()
        let userLocation = mainMap.userLocation
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)!,2000 , 2000)
        mainMap.setRegion(region, animated: true)
        
    }
    
   
    
        
    @IBOutlet weak var mainMap: MKMapView!
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mainMap.setRegion(region, animated: true)
        
        
        self.mainMap.showsUserLocation = true
        
        
        
        
    }

    
    override func viewDidLoad() {
        
        searchBarMap.delegate = self
        
        //show user location
        mainMap.showsUserLocation = true
        
        
        
        /*for SMAttraction in attraction{
            let annotation = MKPointAnnotation()
            annotation.title = SMAttraction.SMName
            annotation.coordinate = CLLocationCoordinate2D(latitude: SMAttraction.latitude, longitude: SMAttraction.longitude)
            mainMap.addAnnotation(annotation)
            
        }*/
        
        let annotations = attraction.map { attraction -> MKAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = attraction.name
            
            
            print(" This is PIN of \(attraction.name) where location LAT \(attraction.latitude) & Long \(attraction.longitude)")
            
            annotation.coordinate = CLLocationCoordinate2DMake(attraction.latitude, attraction.longitude)
//                CLLocationCoordinate2D(latitude: SMAttraction.latitude, longitude: SMAttraction.longitude)
            return annotation
        }
        mainMap.addAnnotations(annotations)


        
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        
        
        
       
                
        
       
   
    }








    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.searchBarMap.text!) { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                
                let placemark = placemarks?.first
                
                let anno = MKPointAnnotation()
                anno.coordinate = (placemark?.location?.coordinate)!
                anno.title = self.searchBarMap.text!
                
                let span = MKCoordinateSpanMake(0.1, 0.1)
                let region = MKCoordinateRegion(center: anno.coordinate, span: span)
                
                self.mainMap.setRegion(region, animated: true)
                
                self.mainMap.selectAnnotation(anno, animated: true)
                
                
                
            }else{
                print(error?.localizedDescription ?? "error")
            }
            
            
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

