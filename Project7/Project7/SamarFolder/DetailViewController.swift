//
//  DetailViewController.swift
//  Project7
//
//  Created by Samar Seth on 2/28/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // Variable declaration
    let defaults = UserDefaults.standard
    var section: Int?
    var row: Int?
    let dorms: [String] = ["Day Hall", "Paul Revere Hall", "Allen House",  "Bartlet Hall", "Foxcroft Hall", "Smith House", "Burtt House", "Newman House", "Stuart Hall", "Fuess Hall", "Nathan Hale House", "Stimson House", "Stevens House", "Adams Hall", "Johnson Hall", "Blanchard House", "Taylor Hall", "Thompson House", "Jewett-Tucker House", "Bishop Hall", "Rockwell Hall", "Pemberton Cottage",  "Pease House", "Isham Dormitory", "Bancroft Hall", "Eaton Cottage", "Andover Cottage", "Williams Hall Carriage House", "French House", "Stowe House", "America House", "Alumni House", "Bertha Bailey House", "Flagg House", "Morton House", "Double Brick House", "Samaritan House",  "Stearns House", "Whitney House", "Carter House", "Clement House", "Draper Cottage"]
    let buildings: [String] = ["Oliver Wendell Holmes Library", "Morse Hall", "Gelb Science Center", "Sykes Wellness Center", "Bullfinch", "Borden and Memorial Gym", "Shuman Admissions Center", "Smith Center", "Case Memorial Cage", "Snyder Center", "Ice Rink", "Samuel Phillips Hall", "George Washington Hall", "Elson Art Center", "Addison Gallery of American Art", "Cochran Chapel", "Graves Hall", "Pearson Hall", "Robert S. Peabody Institute of Archaeology", "Ice Rink"]
    let otherPOI: [String] = ["Phelps Park", "Tennis Courts", "Sorota Track Complex", "Phelps Stadium", "Siberia", "Graves Field", "Moncrief M. Cochran Sanctuary"]
    
    // Outlets
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var headerText: UITextView!
    @IBOutlet weak var purpose: UITextView!
    @IBOutlet weak var hoursHeader: UITextView!
    @IBOutlet weak var days: UITextView!
    @IBOutlet weak var hours: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Text population
        days.text =
        """
        Monday
        Tuesday
        Wednesday
        Thursday
        Friday
        Saturday
        Sunday
        """
        
        // Case & section based text population
        section = defaults.integer(forKey: "selectedSection")
        row = defaults.integer(forKey: "selectedCell")
        
        if section == 0 {
            navigationBar.title = buildings[row!]
            hoursHeader.text = "Hours:"
            
            switch row {
            case 0:
                purpose.text = "Purpose: Library"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 1:
                purpose.text = "Purpose: Math and Computer Science"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 2:
                purpose.text = "Purpose: Sciences (Biology,  Chemistry, Physics, Astronomy)"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 3:
                purpose.text = "Purpose: Medical Center"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 4:
                purpose.text = "Purpose: English"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 5:
                purpose.text = "Purpose: Gym"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 6:
                purpose.text = "Purpose: Admissions"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 7:
                purpose.text = "Purpose: Currently Undergoing Renovations"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 8:
                purpose.text = "Purpose: Currently Undergoing Renovations"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 9:
                purpose.text = "Purpose: Athletics Center"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 10:
                purpose.text = "Purpose: Hockey Rink"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 11:
                purpose.text = "Purpose: History and World Languages"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 12:
                purpose.text = "Purpose: Mail, Day Student Lockers, + other"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 13:
                purpose.text = "Purpose: Art"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 14:
                purpose.text = "Purpose: Art Museum"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 15:
                purpose.text = "Purpose: Chapel"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 16:
                purpose.text = "Purpose: Music"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 17:
                purpose.text = "Purpose: Latin"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 18:
                purpose.text = "Purpose: Archaeology Museum"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            case 19:
                purpose.text = "Purpose: Ice Rink"
                hours.text =
                """
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                9-5
                """
            default:
                purpose.text = ""
                hoursHeader.text = ""
                hours.text = ""
                days.text = ""
            }
        } else if section == 1 {
            navigationBar.title = dorms[row!]
            hoursHeader.text = ""
            hours.text = ""
            days.text = ""
            
            switch row {
            case 0, 1, 2:
                purpose.text = "Girls' Dormitory"
                hoursHeader.text = "Cluster: Flagstaff"
            case 3, 4, 5, 6, 7:
                purpose.text = "Boys' Dormitory"
                hoursHeader.text = "Cluster: Flagstaff"
            case 8, 9:
                purpose.text = "Boys' Dormitory"
                hoursHeader.text = "Cluster: Pine Knoll"
            case 10, 11, 12:
                purpose.text = "Girls' Dormitory"
                hoursHeader.text = "Cluster: Pine Knoll"
            case 13, 14, 15:
                purpose.text = "Girls' Dormitory"
                hoursHeader.text = "Cluster: West Quad South"
            case 16, 17, 18:
                purpose.text = "Boys' Dormitory"
                hoursHeader.text = "Cluster: West Quad South"
            case 19, 20, 21, 22:
                purpose.text = "Boys' Dormitory"
                hoursHeader.text = "Cluster: West Quad North"
            case 23, 24, 25, 26:
                purpose.text = "Girls' Dormitory"
                hoursHeader.text = "Cluster: West Quad North"
            case 27, 28, 29, 30, 31, 32, 33, 34:
                purpose.text = "Boys' Dormitory"
                hoursHeader.text = "Cluster: Abbot"
            case 35, 36, 37, 38, 39, 40, 41:
                purpose.text = "Girls' Dormitory"
                hoursHeader.text = "Cluster: Abbot"
            default:
                hoursHeader.text  = ""
            }
        } else {
            navigationBar.title = otherPOI[row!]
            headerText.text = "No Additional Info"
            purpose.text = ""
            hoursHeader.text =  ""
            hours.text = ""
            days.text = ""
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
    }
}
