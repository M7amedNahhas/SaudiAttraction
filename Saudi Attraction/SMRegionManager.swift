//
//  SMRegionManager.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ١٠ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import Foundation
import MapKit

class SMRegionManager : MKPointAnnotation {
    
    var regionList : [SMRegion]
 
    
    private override init (){
  
        regionList = []
        
        let makkahRegion = SMRegion(regionName: "Makkah", coordinate: CLLocationCoordinate2DMake(21.3890824, 39.85791180000001))
        
        makkahRegion.attractionList?.append(SMAttraction(name: "Masjed Alrajhi", latitude: 21.381874524276196, longitude: 39.87359046936035, info: "aASDasd"))
        makkahRegion.attractionList?.append(SMAttraction(name: "Haram", latitude: 21.42287139999999, longitude: 39.8257347, info: "HARAM"))
        
        let jeddahRegion = SMRegion(regionName: "Jeddah", coordinate: CLLocationCoordinate2DMake(21.2854067, 39.23755069999993))
        
        jeddahRegion.attractionList?.append(SMAttraction(name: "Red Sea Mall", latitude: 21.62759051831776, longitude: 39.11081314086914, info: "Shopping mall"))
        
        regionList.append(jeddahRegion)
        regionList.append(makkahRegion)
        
        
    }
    
  
    
    
            
    func setRegionList () -> [SMRegion] {
        return regionList
    }
    
    static let shared = SMRegionManager ()
   
    
    // Singelton .. 
    // Answers main Application Model Question
    // Loading for Data from server.
    // Reflect this data on views

}
