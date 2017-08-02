//
//  SMDetails.swift
//  Saudi Attraction
//
//  Created by M7amedNahhas on 11/3/1438 AH.
//  Copyright © 1438 WadiMakkah. All rights reserved.
//

import Foundation
import UIKit
class SMDetails{

    var _SMType: String?
    var _SMDescription: String?
    var _SMInfo: String?
    var _SMImage : UIImage?
    
    var SMType : String {
        return _SMType!
    
    }
    var SMDeacription : String {
        return _SMDescription!
        
    }
    var SMInfo : String {
        return _SMInfo!
        
    }
    var SMImage : UIImage {
        return _SMImage!
        
    }
    
    init(SMType: String, SMDescription: String/*, SMInfo: String, SMImage: UIImage*/) {
        self._SMInfo = SMInfo
        self._SMDescription = SMDescription
        self._SMType = SMType
        self._SMImage = SMImage
    }
   
    
    
}
