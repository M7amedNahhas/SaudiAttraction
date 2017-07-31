//
//  SMAttraction.swift
//  Saudi Attraction
//
//  Created by M7amedNahhas on 11/3/1438 AH.
//  Copyright © 1438 WadiMakkah. All rights reserved.
//

import Foundation

class SMAttraction{
    
    var SMName: String?
    
    var SMAttractionList: [SMDetails] = []
    
    init(SMName:String ,SMAttractionList: [SMDetails]) {
        self.SMName = SMName
        self.SMAttractionList = SMAttractionList
        
        
    }
    
    
}
