//
//  MKRegionView.swift
//  Saudi Attraction
//
//  Created by M7amedNahhas on 11/23/1438 AH.
//  Copyright © 1438 WadiMakkah. All rights reserved.
//

import UIKit
import MapKit

class MKRegionView: MKAnnotationView {
    
    let selectedLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
    
    static let share = MKRegionView()
   
   
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(false, animated: animated)
        
        if(selected)
        {
            // Do customization, for example:
            selectedLabel.text = (annotation?.title)!
            selectedLabel.textAlignment = .center
            selectedLabel.font = UIFont.init(name: "HelveticaBold", size: 15)
            selectedLabel.backgroundColor = UIColor.white
            selectedLabel.layer.borderColor = UIColor.clear.cgColor
            selectedLabel.layer.borderWidth = 2
            selectedLabel.layer.cornerRadius = 5
            selectedLabel.layer.masksToBounds = true
            
            
            selectedLabel.center.x = 0.5 * self.frame.size.width;
            selectedLabel.center.y = -0.5 * selectedLabel.frame.height;
            self.addSubview(selectedLabel)
        }
        else
        {
            selectedLabel.removeFromSuperview()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
