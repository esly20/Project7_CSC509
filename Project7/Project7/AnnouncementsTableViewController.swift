//
//  AnnouncementsTableViewController.swift
//  Project7
//
//  Created by Erik Fotta on 2/21/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit
import Foundation

class AnnouncementsTableViewController: UITableViewController {
    
    // Variable Declarations
    let defaults = UserDefaults.standard
    var data: DataLayer = DataLayer()
    let abbotBlue: UIColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)
    var announcementsList: [Announcement] = []
    var studentProgram: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Styling
        self.tableView.backgroundColor = abbotBlue
        viewDidAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Data grab
        data = DataLayer()
        let announcementsData: [Announcement] = data.getAnnouncements()!.announcements
        announcementsList = announcementsData
        let studentProgramData: String = data.getStudentInfo()!.program
        studentProgram = studentProgramData
        announcementParse()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if announcementsList.count != 0 {
            return announcementsList.count
        } else {
            print("Error fetching announcements")
            return 0
        }
    }

    // Date parsing function to convert the string from the JSON formed struct
    func dateParse(inputDate: String) -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-dd-MM'T'HH:mm:ssZ"
        let date = formatter.date(from: inputDate)!
        return date
    }
    
    // Announcement parsing function to clean out announcements that don't pertain to the users specific program
    func announcementParse() {
        var timesRemoved: Int = 0
        for i in (0...announcementsList.count-1) {
            if announcementsList[i-timesRemoved].program == studentProgram || announcementsList[i-timesRemoved].program == "All" {
            } else {
                announcementsList.remove(at: (i - timesRemoved))
                timesRemoved += 1
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnnouncementCell", for: indexPath)
        if let announcementCell = cell as? AnnouncementsTableViewCell {
            
            // Further date parsing for string reformatting
            let date = dateParse(inputDate: announcementsList[indexPath.row].datetime)
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            let month = calendar.component(.month, from: date)
            let hour = calendar.component(.hour, from: date)
            var minute = "\(calendar.component(.minute, from: date))"
            // Makes minutes under 10 appear in their proper form. ex. '02', rather than '2'
            if minute.count < 2 {
                minute = "0\(minute)"
            } else {}
            let shownDate = "\(hour):\(minute), \(month)/\(day)"
            
            //Cell label population
            announcementCell.titleLabel?.text = announcementsList[indexPath.row].title
            announcementCell.senderLabel?.text = "\(announcementsList[indexPath.row].senderfirstname) \(announcementsList[indexPath.row].senderlastname ?? "")"
            announcementCell.bodyLabel?.text = announcementsList[indexPath.row].body
            announcementCell.groupLabel?.text = announcementsList[indexPath.row].program
            announcementCell.timeLabel?.text = shownDate
            return announcementCell
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Further date parsing for formatting
        let date = dateParse(inputDate: announcementsList[indexPath.row].datetime)
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let hour = calendar.component(.hour, from: date)
        var minute = "\(calendar.component(.minute, from: date))"
        if minute.count < 2 {
            minute = "0\(minute)"
        } else {}
        let shownDate = "\(hour):\(minute), \(month)/\(day)"
        
        // New VC Instantiation
        let storyboard = UIStoryboard(name: "AnnouncementsStoryboard", bundle: nil)
        let selectedVC = storyboard.instantiateViewController(identifier: "SelectedVC") as! SelectedAnnouncementViewController
        
        // String compiled for User Defaults
        let slcAnnouncement: [String] = ["\(announcementsList[indexPath.row].title)","\(announcementsList[indexPath.row].senderfirstname) \(announcementsList[indexPath.row].senderlastname ?? "")","\(announcementsList[indexPath.row].body)","\(announcementsList[indexPath.row].program)","\(shownDate)"]
        defaults.set(slcAnnouncement, forKey: "slcAnnouncement" )
       
        // Instantiated VC push
        navigationController?.pushViewController(selectedVC, animated: true)
    }
}
