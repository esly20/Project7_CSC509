//
//  AnnouncementsTableViewCell.swift
//  Project7
//
//  Created by Erik Fotta on 2/21/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit

class AnnouncementsTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
