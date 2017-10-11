//
//  FirstTimeLaunchViewController.swift
//  Saudi Attraction
//
//  Created by M7amedNahhas on 11/30/1438 AH.
//  Copyright © 1438 WadiMakkah. All rights reserved.
//

import UIKit

class FirstTimeLaunchViewController: UIViewController {
    
   
   var time = UserDefaults.standard.bool(forKey: "firstLaunch")
    

    @IBOutlet weak var lable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startBt(_ sender: UIButton) {
        
        time = true
        performSegue(withIdentifier: "toMain",sender: self)
        
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
