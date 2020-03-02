//
//  DetailedActivityViewController.swift
//  Project7
//
//  Created by student on 3/2/20.
//  Copyright © 2020 CSC509. All rights reserved.
//
import Foundation
import UIKit

class DetailedActivityViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var descriptionLabel: UITextView!
    
     let defaults = UserDefaults.standard
       var activity: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidAppear(true)
    }
    override func viewDidAppear(_ animated: Bool) {
        if let slcActivity = defaults.array(forKey: "slcActivity") as? [String] {
                activity = slcActivity
            }
           print(activity)
        nameLabel.text = activity[0]
            timeLabel.text = "\(activity[1]) - \(activity[2])"
            descriptionLabel.text = activity[3]
            locationLabel.text = activity[4]
        }
}
