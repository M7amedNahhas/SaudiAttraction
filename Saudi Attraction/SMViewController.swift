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

class SMViewController: UIViewController {
    
    
    let ksa = CLLocationCoordinate2DMake(24.7135517, 46.67529569999999)
    let makkah = CLLocationCoordinate2DMake(21.3890824, 39.85791180000001)
    let jeddah = CLLocationCoordinate2DMake(21.2854067, 39.23755069999993)
    let riyadh = CLLocationCoordinate2DMake(24.7135517, 46.67529569999999)
    
    
    @IBOutlet weak var mainMap: MKMapView!
    

    
    override func viewDidLoad() {
        
        
        mainMap.showsUserLocation = true
        
        self.mainMap.setVisibleMapRect(self.mainMap.visibleMapRect,edgePadding: UIEdgeInsetsMake(80.0, 60.0, 60, 60.0), animated: true)
        mainMap.setRegion(MKCoordinateRegionMakeWithDistance(ksa, 500000, 1000000), animated: true)
        mainMap.setRegion(MKCoordinateRegionMakeWithDistance(makkah, 1000000, 2000000), animated: true)
        mainMap.setRegion(MKCoordinateRegionMakeWithDistance(jeddah, 1000000, 2000000), animated: true)
        mainMap.setRegion(MKCoordinateRegionMakeWithDistance(riyadh, 1000000, 2000000), animated: true)
        
        let makkahPin = SMRegion(regionName: "Makkah", numberOfAttractions: 3, coordinate: makkah)
        let jeddahPin = SMRegion(regionName: "Jeddah", numberOfAttractions: 5, coordinate: jeddah)
        let riyadhPin = SMRegion(regionName: "Riyadh", numberOfAttractions: 10, coordinate: riyadh)
       
        
        mainMap.addAnnotation(makkahPin)
        mainMap.addAnnotation(jeddahPin)
        mainMap.addAnnotation(riyadhPin)
        
        }
   
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

