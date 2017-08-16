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

class SMRegion : MKPointAnnotation {
    
    var id : String
    let _regionName: String?
    private var _latitude: Double
    private var _longitude: Double

   
    var attractionList : [SMAttraction]?
    
    func setRegionAnnotation(){
        self.coordinate = CLLocationCoordinate2DMake(_latitude, _longitude)
        
        
        self.title = regionName
            }

    var regionName: String {
        
        return _regionName!
        
    }
    
    var longitude: Double{
        return _longitude
    }
    var latitude: Double{
        return _latitude
    }


   
    
    init(regionID: String, regionName:String, latitude: Double,longitude: Double ) {
        
        self.id = regionID
        self._regionName = regionName
        self._latitude = latitude
        self._longitude = longitude
        self.attractionList = []
    }
    
    
    
}
