//
//  BuildingListTableViewController.swift
//  Project7
//
//  Created by Samar Seth on 2/24/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit

class BuildingListTableViewController: UITableViewController {
    let defaults = UserDefaults.standard
    
    let dorms: [String] = ["Day Hall", "Paul Revere Hall",  "Bartlet Hall", "Foxcroft Hall", "Smith House", "Burtt House", "Newman House", "Stuart Hall", "Fuess Hall", "Nathan Hale House", "Stimson House", "Stevens House", "Adams Hall", "Taylor Hall", "Johnson Hall", "Thompson House", "Jewett-Tucker House", "Blanchard House", "Bishop Hall", "Rockwell Hall", "Isham Dormitory", "Bancroft Hall", "Pemberton Cottage", "Eaton Cottage", "Andover Cottage", "Pease House", "Williams Hall Carriage House", "Double Brick House", "Samaritan House",  "Stearns House", "Stowe House", "French House", "Whitney House", "Carter House", "Clement House", "Draper Cottage", "America House", "Alumni House", "Bertha Bailey House", "Flagg House", "Morton House", "Allen House"]
    let buildings: [String] = ["Oliver Wendell Holmes Library", "Morse Hall", "Gelb Science Center", "Sykes Wellness Center", "Bullfinch", "Borden and Memorial Gym", "Shuman Admissions Center", "Smith Center", "Case Memorial Cage", "Snyder Center", "Ice Rink", "Samuel Phillips Hall", "George Washington Hall", "Elson Art Center", "Addison Gallery of American Art", "Cochran Chapel", "Graves Hall", "Pearson Hall", "Robert S. Peabody Institute of Archaeology"]
    let otherPOI: [String] = ["Phelps Park", "Tennis Courts", "Sorota Track Complex", "Phelps Stadium", "Siberia", "Graves Field", "Moncrief M. Cochran Sanctuary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return buildings.count
        } else if section == 1 {
            return dorms.count
        } else {
            return otherPOI.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel!.text = buildings[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel!.text = dorms[indexPath.row]
        } else {
            cell.textLabel!.text = otherPOI[indexPath.row]
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return  "Buildings"
        } else if section == 1 {
            return "Dorms"
        } else {
            return "Other"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defaults.set(indexPath.section, forKey: "selectedSection")
        defaults.set(indexPath.row, forKey: "selectedCell")
        
        self.performSegue(withIdentifier: "selectedCell", sender: self)
    }
}
