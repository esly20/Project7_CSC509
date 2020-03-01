//
//  ProfileViewController.swift
//  Project7
//
//  Created by Ryan Mai on 2/21/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var data: DataLayer = DataLayer(userID: 1)
    
    //Outlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var clusterDormLabel: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
        
        let mainStudent: Student = data.getStudentInfo()!

        print(mainStudent)
        
        fullNameLabel.textColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)
        
        fullNameLabel.text =  "\(mainStudent.firstname) \(mainStudent.lastname)"
        programLabel.text = mainStudent.program
        if mainStudent.boarder == true {
            clusterDormLabel.text = "\(mainStudent.cluster) • \(mainStudent.dorm)"
        } else {
            clusterDormLabel.text = "\(mainStudent.cluster) • Day Student"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
