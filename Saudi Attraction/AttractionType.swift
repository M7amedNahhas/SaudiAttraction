//
//  AttractionType.swift
//  Saudi Attraction
//
//  Created by M7amedNahhas on 11/21/1438 AH.
//  Copyright © 1438 WadiMakkah. All rights reserved.
//

import UIKit
import NLSegmentControl

class AttractionType : NLSegment{
    var _Name : String
    var _URL : String
    var id : String?
    
    var name:String {
        
        return _Name
    }
    var URL : String {
        return _URL
    }
    
    
    init(name:String,URL:String,ID:String) {
        self.id = ID
        self._Name = name
        self._URL = URL
        
    }
    
    
    
    
}
