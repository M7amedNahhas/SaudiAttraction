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
    let coordinate : CLLocationCoordinate2D
    var attractionList : [SMAttraction]?
    
    init(regionName:String, coordinate : CLLocationCoordinate2D ) {
        
        self.regionName = regionName
        self.coordinate = coordinate
        self.attractionList = []
    }
    
    
    
}
