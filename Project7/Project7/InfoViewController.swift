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
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func commonsButtonPressed(_ sender: Any) {
        let commonsurl = URL(string: "https://phillipsacademy.campusdish.com/en/LocationsAndMenus/PareskyCommons")!
        webView!.load(URLRequest(url: commonsurl))
    }
    @IBAction func paNetButtonPressed(_ sender: Any) {
        let paneturl = URL(string: "https://panet.andover.edu/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_15_1")!
        webView!.load(URLRequest(url: paneturl))
    }
    @IBAction func schoolWebsiteButtonPressed(_ sender: Any) {
        let pawebsiteurl = URL(string: "https://www.andover.eduf")!
        webView!.load(URLRequest(url: pawebsiteurl))
    }
    @IBAction func bluebookButtonPressed(_ sender: Any) {
        let bluebookurl = URL(string: "https://panet.andover.edu/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_15_1")!
        webView!.load(URLRequest(url: bluebookurl))
    }
    @IBAction func athleticsButtonPressed(_ sender: Any) {
        let athleticsurl = URL(string: "https://athletics.andover.edu")!
        webView!.load(URLRequest(url: athleticsurl))
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
