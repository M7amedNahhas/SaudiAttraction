//
//  SMRegionManager.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ١٠ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import Foundation
import MapKit
import Firebase

class SMRegionManager : MKPointAnnotation {
    
    var regionList : [SMRegion] = []
    var ref: DatabaseReference!
    var testList :[SMAttraction] = []
    
    
    
    
    private override init (){
        
  
        regionList = []
        

        
        
        
//        let makkahRegion = SMRegion(regionName: "Makkah", latitude:21.3890824 , longitude:39.8579118 )
//        
//        
//
//
//        makkahRegion.attractionList?.append(SMAttraction(name: "Masjed Alrajhi", latitude: 21.381840, longitude: 39.873662, description: "aASDasd"))
//        makkahRegion.attractionList?.append(SMAttraction(name: "Haram", latitude: 21.3890824, longitude: 39.85791180000001, description: "HARAM"))
//        makkahRegion.attractionList?.append(SMAttraction(name: "Makkah mall", latitude: 21.391079, longitude: 39.884589, description: "mall of makkah"))
//        
//
//
//        let jeddahRegion = SMRegion(regionName: "Jeddah", latitude: 21.2854067, longitude: 39.2375506)
//        
       let taifRegion = SMRegion(regionName: "Taif", latitude: 21.267060062412437, longitude: 40.410118103027344)
//
//        jeddahRegion.attractionList?.append(SMAttraction(name: "Red Sea Mall", latitude: 21.62759051831776, longitude: 39.11081314086914, description: "Shopping mall"))
//        
//        regionList.append(jeddahRegion)
//        regionList.append(makkahRegion)
        regionList.append(taifRegion)
//        
//        
   }
    func loedCity(){
        ref = Database.database().reference()
        ref.child("SA/citys").queryOrdered(byChild: "CityName").observe(.value, with: {(snapshot)in
            
            
            if let arry = snapshot.value as? [[String: Any]]{
                
                for regionDic in arry{
                let CityName = regionDic["CityName"] as? String ?? "NoCityName"
                let CityLat = regionDic["CityLat"] as? Double ?? 0.0
                let CityLong = regionDic["CityLong"] as? Double ?? 0.0
                
                self.regionList.append(SMRegion(regionName: CityName, latitude: CityLat, longitude: CityLong))
                }
               
                print("My region",self.regionList)
     
            }
   
        }
  )}
    
    func loadAttraction(){
        ref = Database.database().reference()
        ref.child("SA/Attraction").queryOrdered(byChild: "atName").observe(.value, with: {(snapshot)in
            
            if let array = snapshot.value as? [[String: Any]]{
                for attractionDic in array {
                    let atName = attractionDic["atName"] as? String ?? "NoAtName"
                    let atLat = attractionDic["atLat"] as? Double ?? 0.0
                    let atlong = attractionDic["atLong"] as? Double ?? 0.0
                    let atDesc = attractionDic["atDesc"] as? String ?? "NoDescription"
                    
                    self.testList.append(SMAttraction(name: atName, latitude: atLat, longitude: atlong, description: atDesc))
                    
                
                
                
                
                }
                
            }
            
            
            
            
        })
    
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
