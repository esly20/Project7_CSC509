//
//  SettingsTableViewController.swift
//  Project7
//
//  Created by Mark Witt on 2/24/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

//https://www.youtube.com/watch?v=OBsj1GuanVw - video helped me learn to use static table view cells
import UIKit
import Foundation

class SettingsTableViewController: UITableViewController {
    // Variable declaration
    var userId: Int = Int()
    var signInNotifications: Bool = true
    var clusterMunchNotifications: Bool = true
    let defaults = UserDefaults.standard
    let initialMessage = "You have 5 minutes until initial sign-in"
    let finalMessage = "You have 5 minutes until final sign-in"
    let signin = "Sign-In"
    let munch = "Cluster Munch!"
    
    // Outlets
    @IBOutlet weak var signInSwitchStatus: UISwitch!
    @IBOutlet weak var clusterMunchSwitchStatus: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Color Styling-https://stackoverflow.com/questions/24074257/how-can-i-use-uicolorfromrgb-in-swift - this page showed me how to code an rgb color
        self.tableView.backgroundColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Settings setup
        signInNotifications = defaults.bool(forKey: "signIn")
        clusterMunchNotifications = defaults.bool(forKey: "clusterMunch")
        
        if signInNotifications == true {
            signInSwitchStatus.isOn = true
        }else{
            signInSwitchStatus.isOn = false
        }
        if clusterMunchNotifications == true {
            clusterMunchSwitchStatus.isOn = true
        }else{
            clusterMunchSwitchStatus.isOn = false
        }
        
        userId = defaults.integer(forKey: "user")
        let data = DataLayer(userID: userId)
        let student = data.getStudentInfo()
        
        // Notifications
        if student!.boarder == true{
            if signInNotifications == true{
                if (student!.program == "Upper School") || (student!.program == "ELL") || (student!.program == "MS^2"){
                    for i in 1...6{
                        createNotification(weekday: i, hour: 21, min: 25, title: signin, message: finalMessage)
                    }
                    createNotification(weekday: 7, hour: 19 , min: 25, title: signin, message: initialMessage)
                    createNotification(weekday: 7, hour: 22 , min: 55, title:signin, message: finalMessage)
                }
                if student!.program == "Lower School"{
                    for i in [2,5,6]{
                        createNotification(weekday: i, hour: 20, min: 55, title: signin, message: finalMessage)
                    }
                }
            }
        }
        if clusterMunchNotifications == true{
            createNotification(weekday: 4, hour:20, min: 40, title: munch, message: "\(student!.cluster) cluster munch in 5 minutes")
        }
    }
    
    // MARK: - Table view data source
    
    // Notification Creation-https://www.youtube.com/watch?v=JuqQUP0pnZY- followed this video to learn how to create local notifications
    func createNotification(weekday: Int, hour: Int, min: Int, title: String, message: String){
        let content = UNMutableNotificationContent()
            content.title = title
        content.body = message
            content.sound = UNNotificationSound.default
        let dateComponents = DateComponents(calendar: Calendar.current,  hour: hour , minute: min, weekday: weekday )
        let trigger =  UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    // Settings switches - https://www.youtube.com/watch?v=pBhNWJ17-ng&t=208s - video helped me understand how to use switches
    @IBAction func signInSwitchUsed(_ sender: Any) {
            if signInSwitchStatus.isOn == true{
                signInNotifications = true
                defaults.set(true, forKey: "signIn")
            } else {
                signInNotifications = false
                defaults.set(false, forKey: "signIn")
            }
        }
        
    @IBAction func clusterMunchSwitchUsed(_ sender: Any) {
        if clusterMunchSwitchStatus.isOn == true{
            clusterMunchNotifications = true
            defaults.set(true, forKey: "clusterMunch")
        }else{
            clusterMunchNotifications  = false
            defaults.set(false, forKey: "clusterMunch")
        }
    }
    
    // Log out, refurbished some of my project 6 code for the alert and- https://stackoverflow.com/questions/34326632/how-to-return-to-root-view-controller  - this exchange showed how to return to the root VC
    @IBAction func logOutPressed(_ sender: Any) {
        let logOutAlert = UIAlertController(title: "Log Out?", message: "are you sure you want to log out?", preferredStyle: .alert)
        logOutAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak logOutAlert] (_) in
        self.defaults.set(false, forKey: "loggedIn")
        self.defaults.set(0, forKey: "user")
        self.dismiss(animated: true, completion: {});
        }))
        logOutAlert.addAction(UIAlertAction(title: "Cancel", style: .default))
        self.present(logOutAlert, animated: true, completion: nil)
    }
    
    // Styling
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
    }
}
