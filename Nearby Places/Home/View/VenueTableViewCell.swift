//
//  VenueTableViewCell.swift
//  Nearby Places
//
//  Created by A7med Fekry on 15/11/2024.
//

import UIKit

class VenueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UITextView!
    
    @IBOutlet weak var categoryLabel: UILabel!
  
    @IBOutlet weak var categoryImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
