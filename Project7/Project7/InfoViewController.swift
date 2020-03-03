//
//  InfoViewController.swift
//  Project7
//
//  Created by Patrick Alston on 2/21/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit
import WebKit

class InfoViewController: UIViewController, WKNavigationDelegate {
    var urlText: String = ""
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
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
    @IBAction func bluebookButtonPressed(_ sender: Any) {
        if let bluebookurl = URL(string: "https://panet.andover.edu/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_15_1") {
        UIApplication.shared.open(bluebookurl)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }

