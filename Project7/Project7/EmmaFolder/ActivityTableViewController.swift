//
//  ActivityTableViewController.swift
//  Project7
//
//  Created by student on 2/29/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit

class ActivityTableViewController: UITableViewController {
    
    var activityList = [Activity]()
    let abbotBlue: UIColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = abbotBlue

        let urlString = "https://summer-session-api.herokuapp.com/activities"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            } else {
                print("error getting data")
            }
        }
        showError()
        
    }

    func parse(json: Data) {
         let decoder = JSONDecoder()
             if let jsonActivities = try? decoder.decode(Activities.self, from: json) {
                 activityList
                    = jsonActivities.activities
                 tableView.reloadData()
             } else {
                 print("error decoding json")
             }
             let encoder = JSONEncoder()
             if let activityData = try? encoder.encode(activityList){
                 let defaults = UserDefaults.standard
                 defaults.set(activityData, forKey: "ActivityList")
             }
             print("successfully loaded activity data")
         }
     
     func showError() {
         let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
         ac.addAction(UIAlertAction(title: "OK", style: .default))
         present(ac, animated: true)
     }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityTableViewCell
        let activityItem = activityList[indexPath.row]
        cell.nameLabel.text = activityItem.name
        cell.locationLabel.text = activityItem.location
        cell.descriptionLabel.text = activityItem.description
        cell.timeLabel.text = "\(activityItem.time_start) - \(activityItem.time_end)"
        return cell
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
