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
    
    let dorms: [String] = ["Day Hall", "Paul Revere Hall", "Allen House",  "Bartlet Hall", "Foxcroft Hall", "Smith House", "Burtt House", "Newman House", "Stuart Hall", "Fuess Hall", "Nathan Hale House", "Stimson House", "Stevens House", "Adams Hall", "Johnson Hall", "Blanchard House", "Taylor Hall", "Thompson House", "Jewett-Tucker House", "Bishop Hall", "Rockwell Hall", "Pemberton Cottage",  "Pease House", "Isham Dormitory", "Bancroft Hall", "Eaton Cottage", "Andover Cottage", "Williams Hall Carriage House", "French House", "Stowe House", "America House", "Alumni House", "Bertha Bailey House", "Flagg House", "Morton House", "Double Brick House", "Samaritan House",  "Stearns House", "Whitney House", "Carter House", "Clement House", "Draper Cottage"]
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
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.backgroundColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)
        if section == 0 {
            return  "Buildings"
        } else if section == 1 {
            return "Dorms"
        } else {
            return "Other"
        }
    }
    
    // copied from: https://stackoverflow.com/questions/30240594/change-the-sections-header-background-color-in-uitableview-using-an-array-of-hea
    // Changes the color of each section header's background and text
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor(red: 102/255, green: 173/255, blue: 220/255, alpha: 1)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defaults.set(indexPath.section, forKey: "selectedSection")
        defaults.set(indexPath.row, forKey: "selectedCell")
        
        self.performSegue(withIdentifier: "selectedCell", sender: self)
    }
}
