//
//  LoginViewController.swift
//  Project7
//
//  Created by Mark Witt on 3/2/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    let defaults = UserDefaults.standard
    var studentId:Int = Int()
    var isLoggedIn:Bool = Bool()
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    var studentList = [Student]()
    var firstnames = [String]()
    var lastnames = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://summer-session-api.herokuapp.com/students"
            if let url = URL(string: urlString) {
              if let data = try? Data(contentsOf: url) {
                parseStudents(json: data)
              } else {
                print("error getting data")
              }
            }
        for student in studentList{
            firstnames.append(student.firstname)
            lastnames.append(student.lastname)
            print(studentList.count)
        }

        studentId = defaults.integer(forKey: "user")
        isLoggedIn = defaults.bool(forKey: "loggedIn")
        if isLoggedIn == true{
            performSegue(withIdentifier: "login", sender: nil)
        }
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let firstname = firstNameTextField.text
        let lastname = lastNameTextField.text
        
        if firstname == "" || lastname == ""{
            return
        }
        DoLogin(firstname!, lastname!)
    }
    func DoLogin(_ first:String,_ last:String){
        if let i: Int = firstnames.firstIndex(of: first)  {
            let lastname = lastnames[i]
            if lastname == last{
                performSegue(withIdentifier: "login", sender: nil)
                defaults.set(true, forKey: "loggedIn")
                defaults.set(i+1, forKey: "user")
            } else {
                LoginError()
            }
        } else {
            LoginError()
        }
    }
    func LoginError(){
        let invalidLoginAlert = UIAlertController(title: "Uh Oh", message:
            "Either your username or password are incorrect", preferredStyle: .alert)
        invalidLoginAlert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(invalidLoginAlert, animated: true, completion: nil)
    }
    
    
    func parseStudents(json: Data) {
    let decoder = JSONDecoder()
    if let jsonStudents = try? decoder.decode(Students.self, from: json) {
        studentList = jsonStudents.students
        
        print("successfully loaded student name data")
        } else {
            print("error decoding student name json")
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

