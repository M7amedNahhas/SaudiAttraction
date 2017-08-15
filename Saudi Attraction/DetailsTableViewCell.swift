//
//  DetailsTableViewCell.swift
//  Saudi Attraction
//
//  Created by عبدالرحمن الفارس on ٢٣ ذو. ق، ١٤٣٨ هـ.
//  Copyright © ١٤٣٨ هـ WadiMakkah. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    
    var attraction : SMAttraction?
    
    
    
    @IBOutlet weak var attractionType: UILabel!
    
    
    @IBOutlet weak var attractionName: UILabel!

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
    func UpdateAttractionType() {
        attractionType.text = attraction?.type

    }


}
