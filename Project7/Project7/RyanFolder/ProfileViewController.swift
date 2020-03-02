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
    var abbotBlue: UIColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)
    
    // MARK: Outlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var clusterDormLabel: UILabel!
    @IBOutlet weak var contactInfoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var coursesActivitiesLabel: UILabel!
    @IBOutlet weak var courseOneLabel: UILabel!
    @IBOutlet weak var courseTwoLabel: UILabel!
    @IBOutlet weak var courseThreeLabel: UILabel!
    @IBOutlet weak var courseFourLabel: UILabel!
    @IBOutlet weak var courseFiveLabel: UILabel!
    @IBOutlet weak var studentTeamButton: UIButton!
    
    
    func loadText(mainStudent: Student, mainStudentSchedule: Schedule) {
        fullNameLabel.textColor = abbotBlue
        contactInfoLabel.textColor = abbotBlue
        coursesActivitiesLabel.textColor = abbotBlue
        
        fullNameLabel.text =  "\(mainStudent.firstname) \(mainStudent.lastname)"
        programLabel.text = mainStudent.program
        if mainStudent.boarder == true {
            clusterDormLabel.text = "\(mainStudent.cluster) • \(mainStudent.dorm)"
        } else {
            clusterDormLabel.text = "\(mainStudent.cluster) • Day Student"
        }
        emailLabel.text = mainStudent.email
    
        //Course Set Up
        var courses: [String] = []
        
        for i in 0...mainStudentSchedule.schedule.count - 1 {
            courses.append(mainStudentSchedule.schedule[i].name)
        }
        
        switch courses.count {
        case 1:
            courseOneLabel.text = courses[0]
            courseTwoLabel.removeFromSuperview()
            courseThreeLabel.removeFromSuperview()
            courseFourLabel.removeFromSuperview()
            courseFiveLabel.removeFromSuperview()
        case 2:
            courseOneLabel.text = courses[0]
            courseTwoLabel.text = courses[1]
            courseThreeLabel.removeFromSuperview()
            courseFourLabel.removeFromSuperview()
            courseFiveLabel.removeFromSuperview()
        case 3:
            courseOneLabel.text = courses[0]
            courseTwoLabel.text = courses[1]
            courseThreeLabel.text = courses[2]
            courseFourLabel.removeFromSuperview()
            courseFiveLabel.removeFromSuperview()
        case 4:
            courseOneLabel.text = courses[0]
            courseTwoLabel.text = courses[1]
            courseThreeLabel.text = courses[2]
            courseFourLabel.text = courses[3]
            courseFiveLabel.removeFromSuperview()
        case 5:
            courseOneLabel.text = courses[0]
            courseTwoLabel.text = courses[1]
            courseThreeLabel.text = courses[2]
            courseFourLabel.text = courses[3]
            courseFiveLabel.text = courses[4]
        default:
            print("Error loading courses")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button set up
        studentTeamButton.backgroundColor = abbotBlue
        studentTeamButton.layer.cornerRadius = 20
        
        //Creating variables and getting data from Datalayer
        let mainStudent: Student = data.getStudentInfo()!
        let mainStudentSchedule: Schedule = data.getSchedule()!
        
        //Loading Text into View
        loadText(mainStudent: mainStudent, mainStudentSchedule: mainStudentSchedule)
        
    }
}

//NOTES:
/*
 Add in cluster dean, make switch statement for cluster deans based off of cluster
 */
