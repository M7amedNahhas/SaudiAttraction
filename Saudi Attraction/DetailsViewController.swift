//
//  DetailsViewController.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ٢٢ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire






class DetailsViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var attractionDetails: UITableView!
   
    var attraction : SMAttraction!
    
    
    

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            
            if let attractionImagesCell = tableView.dequeueReusableCell(withIdentifier: "attractionImages", for: indexPath) as?DetailsTableViewCell {
                
                attractionImagesCell.attraction = attraction
                attractionImagesCell.UpdateAttractionImages()
                
                return attractionImagesCell
            }
            
        }else if indexPath.row == 1{
            if let attractionNameCell = tableView.dequeueReusableCell(withIdentifier: "attractionName", for: indexPath) as?DetailsTableViewCell {
                
                attractionNameCell.attraction = attraction
                attractionNameCell.UpdateAttractionName()
                
                return attractionNameCell
            }
        }else if indexPath.row == 2 {
            
            if let attractionTypeCell = tableView.dequeueReusableCell(withIdentifier: "attractionType", for: indexPath) as?DetailsTableViewCell {
                
                attractionTypeCell.attraction = attraction
                attractionTypeCell.UpdateAttractionType()
                
                return attractionTypeCell
            }
            
        }
        else if indexPath.row == 3 {
       
            if let attractionDescriptionCell = tableView.dequeueReusableCell(withIdentifier: "attractionDescription", for: indexPath) as?DetailsTableViewCell {
                
                attractionDescriptionCell.attraction = attraction
                attractionDescriptionCell.UpdateAttractionDescription()
                
                return attractionDescriptionCell
            }
            
        }else if indexPath.row == 4 {
            
            if let attractionContactInfo = tableView.dequeueReusableCell(withIdentifier: "contactInfo", for: indexPath) as?DetailsTableViewCell {
                
                attractionContactInfo.attraction = attraction
                attractionContactInfo.UpdateContactInfo()
                
                return attractionContactInfo
            }
            
        }


        
        return UITableViewCell()
  
    }
    
    
    
   
    
  /*  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attraction.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AttractionImageCollectionViewCell", for: indexPath) as! AttractionImageCollectionViewCell
        
        imageCell.attraction = attraction
        // set Default Image
        if let url = URL(string: attraction.images[indexPath.row]) {
            imageCell.attractionImages.af_setImage(withURL:url )
        }
        
        
        
        return imageCell
    }
    
*/
    
    
    
    

    
    
    /* let downloadURL = NSURL(string: "http://www.lanlinglaurel.com/data/out/83/4652421-gaming-wallpaper.jpg")!
     attractionImages.af_setImage(withURL: downloadURL as URL)*/
    
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0 )
        {
            return 200
        }
        
        return 55
    }

}
