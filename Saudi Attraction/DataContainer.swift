//
//  DataContainer.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ٩ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import Foundation
import MapKit

class DataContainer {
    
    
    private var _regionName:String!
    private var _numberOfAttractions:Int!
    private var _coordinate : CLLocationCoordinate2D!
    
    
    var regionName :String {
        return _regionName
    }
    
    var numberOfAttractions : Int {
        return _numberOfAttractions
    }
    
    var coordinate : CLLocationCoordinate2D {
        return _coordinate
    }
    
    
    
    init(regName: String , numOfAttractions : Int , coordinate : CLLocationCoordinate2D) {
        _regionName = regName
        _numberOfAttractions = numOfAttractions
        _coordinate = coordinate
        
        
        
        
    }

}
