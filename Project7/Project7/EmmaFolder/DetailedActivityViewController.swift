//
//  DetailedActivityViewController.swift
//  Project7
//
//  Created by student on 3/2/20.
//  Copyright © 2020 CSC509. All rights reserved.
//
import Foundation
import UIKit

class DetailedActivityViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var descriptionLabel: UITextView!
    let defaults = UserDefaults.standard
    var activity: [String] = []
    var alertText: String = ""
    var alertText2: String = ""
    let encoder = JSONEncoder()
    var slcstudentActivity: [String] = []
    var studentID: [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = defaults.array(forKey: "user") as? [String] {
            studentID = user
        }
        viewDidAppear(true)

    }
    override func viewDidAppear(_ animated: Bool) {
        if let slcActivity = defaults.array(forKey: "slcActivity") as? [String] {
                activity = slcActivity
            }
//        if let slcstudentActivityList = defaults.array(forKey: "slcstudentActivity") as? [String] {
//            slcstudentActivity = slcstudentActivityList
//        }
          // print(activity)
        nameLabel.text = activity[0]
            timeLabel.text = "\(activity[1]) - \(activity[2])"
            descriptionLabel.text = activity[3]
            locationLabel.text = activity[4]
        alertText = "You have signed up for \(activity[0])"
        alertText2 = "You have already signed up for \(activity[0])"
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
//        let alert = UIAlertController(title: "Sign Up", message: self.alertText, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler:{ action in
//            self.navigationController?.popViewController(animated: true)
//        }))
//        self.present(alert, animated: true, completion: nil)
    
        //need to make studnet id from user defaults
        print(studentID)
        //postRequest(urlString: "https://summer-session-api.herokuapp.com/activities/\(activity[5])/student/\(studentID[0])", data: nil)
        postRequest(urlString: "https://summer-session-api.herokuapp.com/activities/\(activity[5])/student/2", data: nil)
    }
    
    
    func postRequest(urlString: String, data: Data?) {
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
    //    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
    //    request.httpBody = data
    //    print(request)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Client error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Server error: \(String(describing: response))")
                return
            }
            if let mimeType = httpResponse.mimeType, mimeType == "application/json",
                let data = data,
                let string = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    // Put your actual code here!
                   // print("im supoosed to put real code here but what that is idk")
                    let alert = UIAlertController(title: "Sign Up", message: self.alertText, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler:{ action in
                        self.navigationController?.popViewController(animated: true)
                        
                    }))
                    self.present(alert, animated: true, completion: nil)
                    print(string)
                }
                //If i wnat a differnt alert to pop up if the post fails because the data already exists is this where that would go?
            }else {
                    let alert2 = UIAlertController(title: "Uh-Oh", message: self.alertText2, preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler:{ action in
                        self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert2, animated: true, completion: nil)
            }
    }
        task.resume()
    }
    let postDataString: String = ""
    //let postData: Data = try! encoder.encode(postDataString)
    
}
