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
        
        makkahRegion.attractionList?.append(SMAttraction(name: "Masjed Alrajhi", latitude: 21.381840, longitude: 39.873662, info: "aASDasd"))
        makkahRegion.attractionList?.append(SMAttraction(name: "Haram", latitude: 21.3890824, longitude: 39.85791180000001, info: "HARAM"))
        makkahRegion.attractionList?.append(SMAttraction(name: "Makkah mall", latitude: 21.391079, longitude: 39.884589, info: "mall of makkah"))
        
        
        
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
