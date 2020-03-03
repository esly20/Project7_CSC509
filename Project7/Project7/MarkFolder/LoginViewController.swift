//
//  LoginViewController.swift
//  Project7
//
//  Created by Mark Witt on 3/2/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController, UITextFieldDelegate {
    // Variable declarations
    let defaults = UserDefaults.standard
    var studentId:Int = Int()
    var isLoggedIn:Bool = Bool()
    var studentList = [Student]()
    var firstnames = [String]()
    var lastnames = [String]()
    
    // Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        // API parsing
        let urlString = "https://summer-session-api.herokuapp.com/students"
            if let url = URL(string: urlString) {
              if let data = try? Data(contentsOf: url) {
                parseStudents(json: data)
              } else {
                print("error getting data")
              }
            }
        
        for student in studentList {
            firstnames.append(student.firstname)
            lastnames.append(student.lastname)
            print(studentList.count)
        }
        
        // Defaults
        studentId = defaults.integer(forKey: "user")
        isLoggedIn = defaults.bool(forKey: "loggedIn")
        if isLoggedIn == true{
            performSegue(withIdentifier: "login", sender: nil)
        }
        // Styling
        loginButton.layer.cornerRadius = 20
        registerForKeyboardNotifications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
            /// print(studentList.count)
            }
        
        // Defaults
        studentId = defaults.integer(forKey: "user")
        isLoggedIn = defaults.bool(forKey: "loggedIn")
        if isLoggedIn == true{
            performSegue(withIdentifier: "login", sender: nil)
        }
        
        // Styling
        loginButton.layer.cornerRadius = 20
        
        // Keyboard handling
        registerForKeyboardNotifications()
    }
    
    // Log in
    @IBAction func loginPressed(_ sender: Any) {
        let firstname = firstNameTextField.text
        let lastname = lastNameTextField.text
        
        if firstname == "" || lastname == ""{
            return
        }
        DoLogin(firstname!, lastname!)
    }
    
    // Login set up
    func DoLogin(_ first:String,_ last:String){
        if let i: Int = firstnames.firstIndex(of: first)  {
            let lastname = lastnames[i]
            if lastname == last{
                performSegue(withIdentifier: "login", sender: nil)
                defaults.set(true, forKey: "loggedIn")
                defaults.set(i+1, forKey: "user")
                print(studentId)
            } else {
                LoginError()
            }
        } else {
            LoginError()
        }
    }
    
    // Login error handling
    func LoginError(){
        let invalidLoginAlert = UIAlertController(title: "Login Failed", message:
            "invalid first name or last name", preferredStyle: .alert)
        invalidLoginAlert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(invalidLoginAlert, animated: true, completion: nil)
    }
    
    // Parsing
    func parseStudents(json: Data) {
    let decoder = JSONDecoder()
    if let jsonStudents = try? decoder.decode(Students.self, from: json) {
        studentList = jsonStudents.students
        print("successfully loaded student name data")
        } else {
            print("error decoding student name json")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return false
    }
     
    // Keyboard handling
    func registerForKeyboardNotifications() {
      NotificationCenter.default.addObserver(self,
                          selector: #selector(keyboardWasShown(_:)),
                          name: UIResponder.keyboardDidShowNotification,
                          object: nil)
      NotificationCenter.default.addObserver(self,
                          selector: #selector(keyboardWillBeHidden(_:)),
                          name: UIResponder.keyboardWillHideNotification,
                          object: nil)
      NotificationCenter.default.addObserver(self,
                          selector: #selector(keyboardWasShown(_:)),
                          name: UIResponder.keyboardWillChangeFrameNotification,
                          object: nil)
    }
    
    @objc func keyboardWasShown(_ notificiation: NSNotification) {
      guard let info = notificiation.userInfo,
        let keyboardFrameValue =
        info[UIResponder.keyboardFrameBeginUserInfoKey]
          as? NSValue
        else { return }
      let keyboardFrame = keyboardFrameValue.cgRectValue
      let keyboardSize = keyboardFrame.size
       
      let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0,
                       bottom: keyboardSize.height, right: 0.0)
      scrollView.contentInset = contentInsets
      scrollView.scrollIndicatorInsets = contentInsets
    }
     
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
      let contentInsets = UIEdgeInsets.zero
      scrollView.contentInset = contentInsets
      scrollView.scrollIndicatorInsets = contentInsets
      self.view.layoutIfNeeded()
    }
}

