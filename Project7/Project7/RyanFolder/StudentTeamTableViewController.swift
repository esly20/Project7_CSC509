//
//  StudentTeamTableViewController.swift
//  Project7
//
//  Created by Ryan Mai on 3/2/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit

class StudentTeamTableViewController: UITableViewController {
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    // Setup
    var data = DataLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        data = DataLayer()
        navigationTitle.title = "\(data.getStudentInfo()!.firstname)'s Team"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.getStudentTeam()!.team.count
    }

    // Cell Setup
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team: [Faculty] = data.getStudentTeam()!.team
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentTeamReuseIdentifier", for: indexPath)

        if let cellWithOtherName = cell as? StudentTeamTableViewCell {
            cellWithOtherName.fullNameLabel.text = "\(team[indexPath.row].firstname) \(team[indexPath.row].lastname)"
            cellWithOtherName.dormLabel.text = "\(team[indexPath.row].dorm) House"
            cellWithOtherName.phoneLabel.text = team[indexPath.row].phonenumber
            cellWithOtherName.emailLabel.text = team[indexPath.row].email
            return cellWithOtherName
        }
        return cell
    }
}
