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
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.andover.edu")!
         webView.load(URLRequest(url: url))
        
        
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
