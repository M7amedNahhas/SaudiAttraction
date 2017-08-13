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

        
      /*
        let makkahRegion = SMRegion(regionID: "", regionName: "Makkah", latitude:21.3890824 , longitude:39.85791180000001 )
        
        makkahRegion.attractionList?.append(SMAttraction(name: "Masjed Alrajhi", latitude: 21.381840, longitude: 39.873662, description: "Masjid Aishah Alrajhi in Alnseem", type: "Religious", contactInfo: "-", images: []))
       makkahRegion.attractionList?.append(SMAttraction(name: "Haram", latitude: 21.3890824, longitude: 39.85791180000001, description: "HARAM"))
        makkahRegion.attractionList?.append(SMAttraction(name: "Makkah mall", latitude: 21.391079, longitude: 39.884589, description: "mall of makkah"))
        


        
        


        
        
        
        let riyadhRegion = SMRegion(regionID: "!!!!!!",regionName: "Riyadh", latitude: 24.7135517, longitude: 46.67529569999999)
        riyadhRegion.attractionList?.append(SMAttraction(name: "Al Faisaliyah ", latitude: 24.6905765, longitude: 46.68509700000004, description: " "))
        riyadhRegion.attractionList?.append(SMAttraction(name: "برج المملكة ", latitude: 24.7111837, longitude: 46.67340100000001, description: " "))
        
        
        
        
        let madinahRegion = SMRegion(regionID: "!!!!!!", regionName: "Almadinah", latitude:24.468088137204234 , longitude:39.61051940917969 )
        madinahRegion.attractionList?.append(SMAttraction(name: "المسجد النبوي الشريف", latitude: 24.468088137204234, longitude: 39.61051940917969, description: " "))
        madinahRegion.attractionList?.append(SMAttraction(name: "جبل أحد", latitude: 24.5217701, longitude: 39.62600580000003, description: " "))
        madinahRegion.attractionList?.append(SMAttraction(name: "Alnoor Mall", latitude: 24.4961496, longitude: 39.59560550000003, description: "Shopping mall"))

        
        
        
        //regionList.append(jeddahRegion)
        //regionList.append(makkahRegion)
        regionList.append(riyadhRegion)
        regionList.append(madinahRegion)
      
   }
         
            
            
            
        })
    



             regionList.append(jeddahRegion)
             regionList.append(riyadhRegion)
             regionList.append(madinahRegion)
             regionList.append(makkahRegion)

 
 */
        
        

    }

    

    func loedCity(){
        ref = Database.database().reference()
        ref.child("SA/citys").queryOrdered(byChild: "CityName").observe(.value, with: {(snapshot)in
            
            
            if let arry = snapshot.value as? [[String: Any]]{
                
                for regionDic in arry{
                    let CityID = regionDic["id"] as? String ?? "id"
                    let CityName = regionDic["CityName"] as? String ?? "NoCityName"
                    let CityLat = regionDic["CityLat"] as? Double ?? 0.0
                    let CityLong = regionDic["CityLong"] as? Double ?? 0.0
                    
                    self.regionList.append(SMRegion(regionID: CityID, regionName: CityName, latitude: CityLat, longitude: CityLong))
                }
                
                print("My region",self.regionList)
                
            }
            
        }
        )}
    
    
    
    func loadAttraction(regionID: String, completionHandler:@escaping ([SMAttraction]) -> ()) {
        ref = Database.database().reference()
        ref.child("SA/Attraction").child("\(regionID)").queryOrdered(byChild: "atName").observe(.value, with: {(snapshot)in
            
            var attractionList = [SMAttraction]()
            if let array = snapshot.value as? [[String: Any]]{
                for attractionDic in array {
                    let atName = attractionDic["name"] as? String ?? "NoAtName"
                    let atLat = attractionDic["lat"] as? Double ?? 0.0
                    let atlong = attractionDic["lng"] as? Double ?? 0.0
                    let atDesc = attractionDic["Desc"] as? String ?? "NoDescription"
                    let atType = attractionDic["Type"] as? String ?? "NOType"
                    
                    attractionList.append(SMAttraction(name: atName, latitude: atLat, longitude: atlong, description: atDesc, type: atType, contactInfo: "!!", images: []))
                }
                
                completionHandler(attractionList)
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
