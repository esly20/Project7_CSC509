//
//  DataLayer.swift
//  Project7
//
//  Created by Ryan Mai on 2/26/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import Foundation
import UIKit

class DataLayer {
    let defaults = UserDefaults.standard
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    let userId: Int
    let urlStudentInfoString: String
    let urlStudentTeamString: String
    
    //Initializer
    init(userID: Int) {
        self.userId = userID
        urlStudentInfoString = "https://summer-session-api.herokuapp.com/student/\(userId)/info"
        urlStudentTeamString = "https://summer-session-api.herokuapp.com/student/\(userId)/team"
    }
    
    //Method to return the Student info in the form of the Student struct
    func getStudentInfo() -> Student? {
        let key = "studentInfo"
        //If Student already exists in UserDefaults, retrieve if from UserDefaults
        if(checkUserDefaults(key: key)) {
            if let decodedStudentData = defaults.object(forKey: key) as? Data {
                if let studentData = try? decoder.decode(Student.self, from: decodedStudentData) {
                    return studentData
                }
            }
        } else { //Information does not exist in UserDefaults
            //Get the information from the server
            if let url = URL(string: urlStudentInfoString) {
                if let data = try? Data(contentsOf: url) {
                    do {
                        //Parse the info and decode data
                        let response = try decoder.decode(Student.self, from: data)
                        //Encode Data and set it in UserDefaults
                        if let encodedUserDefaults = try? encoder.encode(response) {
                            defaults.set(encodedUserDefaults, forKey: key)
                            //return the decoded data and end the method
                            return response
                        }
                    } catch {
                        print("Parsing Failed")
                        return nil
                    }
                }
            }
        }
        //this should not be executed
        print("Error retrieving Student")
        return nil
    }
    
    func getStudentTeam() -> Team? {
        if let url = URL(string: urlStudentTeamString) {
            if let data = try? Data(contentsOf: url) {
                if let jsonTeam = try? decoder.decode(Team.self, from: data) {
                    if let encodedUserDefaults = try? encoder.encode(jsonTeam) {
                        defaults.set(encodedUserDefaults, forKey: "studentTeam")
                    }
                    print("jsonTeam successful")
                    return jsonTeam
                }
            }
        }
        return nil
    }
    
    //Method that checks whether the Student struct already exists in UserDefaults
    func checkUserDefaults(key: String) -> Bool {
        //Checking if the data exists in UserDefaults
        if let decodedStudentData = defaults.object(forKey: key) as? Data {
            if let _ = try? decoder.decode(Student.self, from: decodedStudentData) {
                //return true if the data is found and exists in UserDefaults
                return true
            }
        }
        return false
    }
    
}
