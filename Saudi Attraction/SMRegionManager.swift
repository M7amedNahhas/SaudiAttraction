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
        
        jeddahRegion.attractionList?.append(SMAttraction(name: "Red Sea Mall", latitude: 21.62759051831776, longitude: 39.11081314086914, description: "Shopping mall"))
        
        
        
        
        let riyadhRegion = SMRegion(regionName: "Riyadh", longitude: 46.67529569999999, latitude: 24.7135517)
        riyadhRegion.attractionList?.append(SMAttraction(name: "Al Faisaliyah ", latitude: 24.6905765, longitude: 46.68509700000004, description: " "))
        riyadhRegion.attractionList?.append(SMAttraction(name: "برج المملكة ", latitude: 24.7111837, longitude: 46.67340100000001, description: " "))
        
        
        
        
        let madinahRegion = SMRegion(regionName: "Almadinah", longitude:39.61051940917969 , latitude:24.468088137204234 )
        madinahRegion.attractionList?.append(SMAttraction(name: "المسجد النبوي الشريف", latitude: 24.468088137204234, longitude: 39.61051940917969, description: " "))
        madinahRegion.attractionList?.append(SMAttraction(name: "جبل أحد", latitude: 24.5217701, longitude: 39.62600580000003, description: " "))
        madinahRegion.attractionList?.append(SMAttraction(name: "Alnoor Mall", latitude: 24.4961496, longitude: 39.59560550000003, description: "Shopping mall"))

        
        
        regionList.append(jeddahRegion)
        regionList.append(makkahRegion)
        regionList.append(riyadhRegion)
        regionList.append(madinahRegion)
        
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
