//
//  SettingsTableViewController.swift
//  Project7
//
//  Created by Mark Witt on 2/24/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit
import Foundation

class SettingsTableViewController: UITableViewController {
    var userId: Int = Int()
    
    
    @IBOutlet weak var signInSwitchStatus: UISwitch!

    @IBOutlet weak var clusterMunchSwitchStatus: UISwitch!
    var signInNotifications: Bool = Bool()
    var clusterMunchNotifications: Bool = Bool()
    let defaults = UserDefaults.standard
    let initialMessage = "You have 5 minutes until initial sign-in"
    let finalMessage = "You have 5 minutes until final sign-in"
    let signin = "Sign-In"
    let munch = "Cluster Munch!"
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
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
            createNotification(weekday: 4, hour: 20, min: 40, title: munch, message: "\(student!.cluster) cluster munch in 5 minutes")
        }
    }
        
        
        
    

    // MARK: - Table view data source
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
    
    @IBAction func signInSwitchUsed(_ sender: Any) {
            if signInSwitchStatus.isOn == true{
                defaults.set(true, forKey: "signIn")
            } else {
                defaults.set(false, forKey: "signIn")
            }
        }
        
    @IBAction func clusterMunchSwitchUsed(_ sender: Any) {
        if clusterMunchSwitchStatus.isOn == true{
            defaults.set(true, forKey: "clusterMunch")
        }else{
            defaults.set(false, forKey: "clusterMunch")
        }
    }
    


    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
