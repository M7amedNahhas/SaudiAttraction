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
        
        
        
        
        let makkahRegion = SMRegion(regionName: "Makkah", longitude:39.85791180000001 , latitude:21.3890824 )
        
        

        makkahRegion.attractionList?.append(SMAttraction(name: "Masjed Alrajhi", latitude: 21.381840, longitude: 39.873662, description: "aASDasd"))
        makkahRegion.attractionList?.append(SMAttraction(name: "Haram", latitude: 21.3890824, longitude: 39.85791180000001, description: "HARAM"))
        makkahRegion.attractionList?.append(SMAttraction(name: "Makkah mall", latitude: 21.391079, longitude: 39.884589, description: "mall of makkah"))
        

        
        let jeddahRegion = SMRegion(regionName: "Jeddah", longitude: 39.23755069999993, latitude: 21.2854067)
        
        let taifRegion = SMRegion(regionName: "Taif", longitude: 40.410118103027344, latitude: 21.267060062412437)
        
        jeddahRegion.attractionList?.append(SMAttraction(name: "Red Sea Mall", latitude: 21.62759051831776, longitude: 39.11081314086914, description: "Shopping mall"))
        
        regionList.append(jeddahRegion)
        regionList.append(makkahRegion)
        regionList.append(taifRegion)
        
        
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
