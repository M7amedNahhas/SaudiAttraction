//
//  SMAttraction.swift
//  Saudi Attraction
//
//  Created by M7amedNahhas on 11/3/1438 AH.
//  Copyright © 1438 WadiMakkah. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit


class SMAttraction: MKPointAnnotation{
    
    private var _name: String?
    private var _latitude: Double
    private var _longitude: Double
    private var _type: String?
    private var _description: String?
    private var _info: String?
    private var _image : UIImage?
    
   /* var type : String {
        return _type!
        
    }
    var SMDeacription : String {
        return _description!
        
    }
        var SMImage : UIImage {
        return _image!
        
    }*/

    var SMInfo : String {
        return _info!
        
    }

    var name: String {
        return _name!
    
    }
   
    var longitude: Double{
        return _longitude
    }
    var latitude: Double{
        return _latitude
    }
    
    
    init(name: String, latitude: Double,longitude: Double/*,type:String,description: String*/,info: String) {
        self._name = name
        self._latitude = latitude
        self._longitude = longitude
        self._info = info
       /*
         self._type = type
        self._description = description
        */
    }
    
    
    
        
    
}
