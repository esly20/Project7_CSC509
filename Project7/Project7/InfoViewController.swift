//
//  InfoViewController.swift
//  Project7
//
//  Created by Patrick Alston on 2/21/20.
//  Copyright © 2020 CSC509. All rights reserved.
//
// I used https://www.hackingwithswift.com/example-code/system/how-to-open-a-url-in-safari to find an easier way to implement webkit into the app to be able to go to the websites that are in the info section.

import UIKit
import WebKit

class InfoViewController: UIViewController, WKNavigationDelegate {
    // Variable declarations
    var urlText: String = ""
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // List of actions to connect WebKit buttons
    @IBAction func commonsButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://phillipsacademy.campusdish.com/LocationsAndMenus/PareskyCommons") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func paNetButtonPressed(_ sender: Any) {
        if let paneturl = URL(string: "https://panet.andover.edu/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_15_1") {
        UIApplication.shared.open(paneturl)
    }
}
    @IBAction func schoolWebsiteButtonPressed(_ sender: Any) {
        if let pawebsiteurl = URL(string: "https://www.andover.edu") {
        UIApplication.shared.open(pawebsiteurl)
        }
    }
    @IBAction func athleticsButtonPressed(_ sender: Any) {
        if let athleticsurl = URL(string: "https://athletics.andover.edu") {
        UIApplication.shared.open(athleticsurl)
    }
}
    @IBAction func addisonButtonPressed(_ sender: Any) {
        if let addisonurl = URL(string: "https://addison.andover.edu/Pages/default.aspx") {
        UIApplication.shared.open(addisonurl)
        }
    }
    @IBAction func peabodyButtonPressed(_ sender: Any) {
        if let peabodyurl = URL(string: "https://peabody.andover.edu") {
        UIApplication.shared.open(peabodyurl)
        }
    }
}
