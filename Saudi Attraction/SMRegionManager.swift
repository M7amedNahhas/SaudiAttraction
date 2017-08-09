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
    
    var regionList : [SMRegion]
    var ref: DatabaseReference!
    var testList :[SMAttraction] = []
 
    
    private override init (){
        
  
        regionList = []
        
        let makkahRegion = SMRegion(regionName: "Makkah", latitude:21.3890824, longitude: 39.85791180000001)

        makkahRegion.attractionList?.append(SMAttraction(name: "Masjed Alrajhi", latitude: 21.381840, longitude: 39.873662, description: "aASDasd"))
        makkahRegion.attractionList?.append(SMAttraction(name: "Haram", latitude: 21.3890824, longitude: 39.85791180000001, description: "HARAM"))
        makkahRegion.attractionList?.append(SMAttraction(name: "Makkah mall", latitude: 21.391079, longitude: 39.884589, description: "mall of makkah"))
        

        
        let jeddahRegion = SMRegion(regionName: "Jeddah", latitude: 21.2854067, longitude: 21.2854067)
        
        jeddahRegion.attractionList?.append(SMAttraction(name: "Red Sea Mall", latitude: 21.62759051831776, longitude: 39.11081314086914, description: "Shopping mall"))
        
        regionList.append(jeddahRegion)
        regionList.append(makkahRegion)
        
        
    }
    func loedManager(){
        ref = Database.database().reference()
        ref.child("Region").observe(.value, with: {(snapshot)in
            
            if let dictionary = snapshot.value as? [String: Any]{
                
                let name = dictionary["atname"] as? String ?? "NoName"
                let lati = dictionary["atlati"] as? Double ?? 0.0
                let long = dictionary["atlong"] as? Double ?? 0.0
                let desc = dictionary["atdesc"] as? String ?? "NoDescription"
                
                self.testList.append(SMAttraction(name: name, latitude: lati, longitude: long, description: desc))
                
                print( "This is the location Name: \(name), Lat: \(lati) , Long: \(long) & the description is : \(desc)" )
                print("new at:",self.testList.count)
            }
            
            
            
            
         
            
        }
  )}
    
//    func setCitys(cityID: String, cityData: [String : AnyObject]){
//        var atName:String!
//        var atLatitude:Double!
//        var atLongitude:Double!
//        var atdesc:String!
//        
//        if let atName1 = cityData["atName"] as? String{
//            atName = atName1
//        }
//        else{
//            atName = "no_data"
//        
//        }
//        if let atLatitude1 = cityData["atLatitude"] as? Double{
//            atLatitude = atLatitude1
//        }
//        else{
//            atLatitude = 0.0
//        
//        }
//        if let atLongitude1 = cityData["atLongitude"] as? Double{
//            atLongitude = atLongitude1
//        }
//        else{
//            atLongitude = 0.0
//        
//        }
//        if let atdesc1 = cityData["atdesc"] as? String{
//            atdesc = atdesc1
//        }
//        else{
//            atdesc = "no_data"
//            
//        }
//
//        self.testList.append(SMAttraction(name: atName, latitude: atLatitude, longitude: atLongitude, description: atdesc))
//        
//        
//    }
    



 
   
    
  
    
    
            
    func setRegionList () -> [SMRegion] {
        return regionList
    }
    
    static let shared = SMRegionManager ()
   
    
    // Singelton .. 
    // Answers main Application Model Question
    // Loading for Data from server.
    // Reflect this data on views

}
