//
//  DetailsViewController.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ٢٢ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import UIKit




class DetailsViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var attractionDetails: UITableView!
    var attraction : SMAttraction!
    
    
    

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            if let attractionNameCell = tableView.dequeueReusableCell(withIdentifier: "attractionName", for: indexPath) as?DetailsTableViewCell {
                
                attractionNameCell.attraction = attraction
                attractionNameCell.UpdateAttractionName()
                
                return attractionNameCell
            }
        }
        else if indexPath.row == 1 {
       
            if let attractionTypeCell = tableView.dequeueReusableCell(withIdentifier: "attractionType", for: indexPath) as?DetailsTableViewCell {
                
                attractionTypeCell.attraction = attraction
                attractionTypeCell.UpdateAttractionType()
                
                return attractionTypeCell
            }
            
        }
        
        
            return UITableViewCell()
        
    }

    
    
    
    
    
    @IBAction func discardDetailsViewAction(_ sender: UITapGestureRecognizer) {
        
        self.view.removeFromSuperview()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewIfLoaded?.backgroundColor?.setFill()
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
