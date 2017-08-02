//
//  SMRegionManager.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ١٠ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import Foundation
import MapKit

class SMRegionManager   {
    
    var regionList : [SMRegion]?
    
    // Singelton .. 
    // Answers main Application Model Question
    // Loading for Data from server.
    // Reflect this data on views
    
    
    func getAttractions( forRegionID id: Int) -> SMRegion{
        // search from his list of region on the same region ID
        
        // if exist return the region
        return []
    }
}
