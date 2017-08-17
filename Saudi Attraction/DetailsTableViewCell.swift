//
//  DetailsTableViewCell.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ٢٣ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell, UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var openingHourstitle: UILabel!
    @IBOutlet weak var attractionDescription: UITextView!
    @IBOutlet weak var contactInfo: UILabel!
    
    
    @IBOutlet weak var attractionOpeningHours: UILabel!
    var attraction : SMAttraction?
    
    var ImageColectionCell : AttractionImageCollectionViewCell?
    
    
    
    @IBOutlet weak var attractionName: UILabel!
    
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!

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
    
    func UpdateAttractionType (){
        
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
        
        imagesCollectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attraction?.images.count ?? 0
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
