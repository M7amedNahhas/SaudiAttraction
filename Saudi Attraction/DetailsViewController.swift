//
//  DetailsViewController.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ١٨ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import UIKit



class DetailsViewController: UIViewController {
    
    var attraction : SMAttraction?
    
    
    @IBOutlet weak var attractionName: UILabel!
    
    @IBOutlet weak var atrractionType: UILabel!
    
    @IBOutlet weak var attractionDescription: UILabel!
    
    @IBOutlet weak var contactInfo: UILabel!
    
    @IBOutlet weak var attractionImages: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attractionName.text = attraction?.name
        attractionDescription.text = attraction?.description
        atrractionType.text = attraction?.type
        contactInfo.text = attraction?.contactInfo
        attractionImages.image = UIImage(named:"Alrajhi")
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
