//
//  StudentTeamTableViewCell.swift
//  Project7
//
//  Created by Ryan Mai on 3/2/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit

class StudentTeamTableViewCell: UITableViewCell {
    
    var abbotBlue: UIColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)
    
    //Outlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var dormLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
         fullNameLabel.textColor = abbotBlue
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
