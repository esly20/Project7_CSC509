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
    var alertText: String = ""
    let encoder = JSONEncoder()


    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidAppear(true)
    }
    override func viewDidAppear(_ animated: Bool) {
        if let slcActivity = defaults.array(forKey: "slcActivity") as? [String] {
                activity = slcActivity
            }
          // print(activity)
        nameLabel.text = activity[0]
            timeLabel.text = "\(activity[1]) - \(activity[2])"
            descriptionLabel.text = activity[3]
            locationLabel.text = activity[4]
        alertText = "You have signed up for \(activity[0])"
        }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sign Up", message: self.alertText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        if let studentActivityData = try? encoder.encode(activity){
        defaults.set(studentActivityData, forKey: "StudentActivityList")
        }
    }
}
