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
    var LoadTypeFromServerArray:[AttractionType] = []
    var LoadPinsSellected:[AttractionType] = []
    
    
    
    
    private override init (){
       
        regionList = []
    }

    

    func loedCity(completionHandler:@escaping ([SMRegion]) -> ()){
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
            
            completionHandler(self.regionList)
        }
        )}
    
    
    
    func loadAttraction(regionID: String,TypeID: String, completionHandler:@escaping ([SMAttraction]) -> ()) {
        ref = Database.database().reference()
        ref.child("SA/Attraction").child("\(regionID)").queryOrdered(byChild: "atName").observe(.value, with: {(snapshot)in
            
            var attractionList = [SMAttraction]()
            if let array = snapshot.value as? [[String: Any]]{
                for attractionDic in array {
                    let atName = attractionDic["name"] as? String ?? "NoName"
                    let atLat = attractionDic["lat"] as? Double ?? 0.0
                    let atlong = attractionDic["lng"] as? Double ?? 0.0
                    let atDesc = attractionDic["Desc"] as? String ?? "NoDescription"
                    let atContactInfo = attractionDic["ContactInfo"] as? String ?? "NoContactInfo"
                    let atType = attractionDic["Type"] as? String ?? "NoType"
                    let opTime = attractionDic["openingTime"] as? String ?? "noData"
                    
                    let imagesArray = attractionDic["images"] as? [[String: Any]] ?? []
                    
                    var images = [String]()
                    for imageDic in imagesArray {
                        images.append(imageDic["URL"] as? String ?? "")
                    }
                    
                    if TypeID == "الكل" || atType == TypeID{
                        attractionList.append(SMAttraction(name: atName, latitude: atLat, longitude: atlong, description: atDesc, type: atType, contactInfo: atContactInfo, images: images, openingTime: opTime))
                    }
                    
                }
                
                completionHandler(attractionList)
            }
        })
        
        
    }
    
    func LoadTypes(completionHandler:@escaping ([AttractionType]) -> ()) {
        ref = Database.database().reference()
        self.ref.child("SA").child("Types").queryOrdered(byChild: "name").observe(.value, with: {(snapshot) in

            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                
                self.LoadTypeFromServerArray.removeAll()
                
                for snap in snapshot {
                    if let postDict = snap.value as? [String : Any] {
                        let name = postDict["name"] as? String ?? "NoName"
                        let URL = postDict["image"] as? String ?? "NoURL"
                        let ID = postDict["id"] as? String ?? "NoID"
                        self.LoadTypeFromServerArray.append(AttractionType(name: name, URL: URL, ID: ID))
                    }
                }
                
                completionHandler(self.LoadTypeFromServerArray)
            }
            
        })
    }
    
    func selectedLoadTypes(selectedType: String,completionHandler:@escaping ([AttractionType]) -> ()) {
        ref = Database.database().reference()
        self.ref.child("SA").child("Types").queryOrdered(byChild: selectedType).observe(.value, with: {(snapshot) in
            
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                
                self.LoadPinsSellected.removeAll()
                
                for snap in snapshot {
                    if let postDict = snap.value as? [String : Any] {
                       
                        self.LoadPinsSellected.append( AttractionType(name: "", URL: "", ID: selectedType))
                    }
                }
                
                completionHandler(self.LoadTypeFromServerArray)
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
