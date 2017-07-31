//
//  SMRegion.swift
//  Saudi Attraction
//
//  Created by M7amedNahhas on 11/3/1438 AH.
//  Copyright © 1438 WadiMakkah. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class SMRegion : NSObject , MKAnnotation {
    
    let regionName: String?
    let numberOfAttractions: Double?
    let coordinate : CLLocationCoordinate2D
    
    init(regionName:String, numberOfAttractions: Double, coordinate : CLLocationCoordinate2D ) {
        
        self.regionName = regionName
        self.numberOfAttractions = numberOfAttractions
        self.coordinate = coordinate
    }
    
    
    
}
