//
//  AttractionDetailsViewController.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ٢٢ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import UIKit

class AttractionDetailsViewController: UIViewController {

    
    var attraction : SMAttraction?
    
    
    @IBOutlet weak var attractionName: UILabel!
    
    @IBOutlet weak var attractionType: UILabel!
    
    @IBOutlet weak var attractionDescription: UILabel!
    
    @IBOutlet weak var contactInfo: UILabel!
    
    @IBOutlet weak var attractionImages: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attractionName.text = attraction?.name
        attractionDescription.text = attraction?.description
        attractionType.text = attraction?.type
        contactInfo.text = attraction?.contactInfo
        attractionImages.image = UIImage(named:"Alrajhi")
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
