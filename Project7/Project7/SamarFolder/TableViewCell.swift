//
//  TableViewCell.swift
//  Project7
//
//  Created by Samar Seth on 2/24/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var name: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
