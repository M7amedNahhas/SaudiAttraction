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
    private var _contactInfo: String?
    private var _images : [String]!
    private var _openingTime : String?
   
    
    
    func setAnnotation()   {
        self.coordinate = CLLocationCoordinate2DMake(_latitude, _longitude)
        self.title = name
        self.subtitle = type
  
    }
    
    var openingTime : String {
        return _openingTime!
    }

    
    var type : String {
        return _type!
    }

    override var description: String  {
        return _description!
    }


    var contactInfo : String {
        return _contactInfo!
    }
    
    var images : [String]{
        return self._images
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
    
    
    init(name: String, latitude: Double, longitude: Double, description: String , type: String , contactInfo: String , images: [String],openingTime: String) {
        self._name = name
        self._latitude = latitude
        self._longitude = longitude
        self._description = description
        self._type = type
        self._contactInfo = contactInfo
        self._images = images
        self._openingTime = openingTime
    }
   
    
        
    
}
