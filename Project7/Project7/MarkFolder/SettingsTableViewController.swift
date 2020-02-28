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
    @IBOutlet weak var signInSwitchStatus: UISwitch!
    @IBOutlet weak var clusterMunchSwitchStatus: UISwitch!
    var signInNotifications: Bool = false
    var clusterMunchNotifications: Bool = false
    let calendar = Calendar.current
    let rightNow = Date()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        //if signInNotifications == true {
            //signInSwitchStatus.isOn = true
        //}else{
            //signInSwitchStatus.isOn = false
      //  }
        //if clusterMunchNotifications == true {
            //clusterMunchSwitchStatus.isOn = true
      //  }else{
            //clusterMunchSwitchStatus.isOn = false
     //   }
        
        signInNotifications = defaults.bool(forKey: "signIn")
        clusterMunchNotifications = defaults.bool(forKey: "clusterMunch")
    }

    // MARK: - Table view data source
    func createReminders(){
        if signInNotifications == true {
            print(1)
        }
        if clusterMunchNotifications == true {
            print(1)
        }
    }
    
    @IBAction func signInSwitchUsed(_ sender: UISwitch) {
        if (sender.isOn == true){
            signInNotifications = true
            defaults.set(true, forKey: "signIn")
        } else {
            signInNotifications = false
            defaults.set(false, forKey: "signIn")
        }
    }
    

    @IBAction func clusterMunchSwitchUsed(_ sender: UISwitch) {
        if (sender.isOn == true){
            clusterMunchNotifications = true
            defaults.set(true, forKey: "clusterMunch")
        }else{
            clusterMunchNotifications = false
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
