//
//  SelectedAnnouncementViewController.swift
//  Project7
//
//  Created by Erik Fotta on 2/26/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit
import Foundation

class SelectedAnnouncementViewController: UIViewController {

    //Outlets
    @IBOutlet weak var slcTitleLabel: UILabel!
    @IBOutlet weak var slcSenderLabel: UILabel!
    @IBOutlet weak var slcBodyLabel: UITextView!
    @IBOutlet weak var slcGroupLabel: UILabel!
    @IBOutlet weak var slcTimeLabel: UILabel!
    
    //Defaults Variables
    let defaults = UserDefaults.standard
    var announcement: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let slcAnnouncement = defaults.array(forKey: "slcAnnouncement") as? [String] {
            announcement = slcAnnouncement
        }
        slcTitleLabel?.text = announcement[0]
        slcSenderLabel?.text = announcement[1]
        slcBodyLabel?.text = announcement[2]
        slcGroupLabel?.text = "To: \(announcement[3])"
        slcTimeLabel?.text = announcement[4]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
