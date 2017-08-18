//
//  DetailsTableViewCell.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ٢٣ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell, UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var openinigHoursTitle: UILabel!
    @IBOutlet weak var descriptionTitle: UILabel!
  
    @IBOutlet weak var contactInfoTitle: UILabel!
    
    
    
    @IBOutlet weak var attractionName: UILabel!
    
    
    @IBOutlet weak var attractionDescription: UITextView!
    @IBOutlet weak var contactInfo: UILabel!
    @IBOutlet weak var openingHours: UILabel!
    
    @IBOutlet weak var counterTextLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!

 
    var attraction : SMAttraction?
    
    var ImageColectionCell : AttractionImageCollectionViewCell?
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func UpdateAttractionName() {
        attractionName.text = attraction?.name
        
    }
    
    func UpdateAttractionOpeningHours (){
        openingHours.text = ("٨ صباحاً - ٤ مساءً")
        
    }
    
    func UpdateAttractionDescription() {
        
        attractionDescription.text = attraction?.description

    }
    func UpdateContactInfo (){
       
        contactInfo.text = attraction?.contactInfo
   
    }
    
    func UpdateAttractionImages (){
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.isPagingEnabled = true
        imagesCollectionView.showsHorizontalScrollIndicator = false
        imagesCollectionView.reloadData()
        
        counterTextLabel.text = "1 / \(attraction?.images.count ?? 0)"
        if(attraction?.images.count ?? 0 == 0){
            counterTextLabel.isHidden = true
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attraction?.images.count ?? 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView ==  self.imagesCollectionView){
            let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
            
            counterTextLabel.text = "\(currentPage + 1) / \(attraction?.images.count ?? 0)"
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AttractionImageCollectionViewCell", for: indexPath) as! AttractionImageCollectionViewCell
        
        imageCell.attraction = attraction
        // set Default Image
        if let url = URL(string: attraction?.images[indexPath.row] ?? "") {
            imageCell.attractionImages.af_setImage(withURL:url )
        }
        
        return imageCell
    }
    
    

   
   
}
