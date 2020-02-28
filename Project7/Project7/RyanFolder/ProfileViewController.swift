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
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
        
        //let studentInfo: Student = data.getStudentInfo()!
        //let studentTeam: Team = data.getStudentTeam()!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
