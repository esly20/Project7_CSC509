//
//  DataLayer.swift
//  Project7
//
//  Created by Ryan Mai on 2/26/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import Foundation
import UIKit

enum DataType {
    case Info
    case Team
}

class DataLayer {
    let defaults = UserDefaults.standard
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    let userId: Int
    let urlStudentInfoString: String
    let urlStudentTeamString: String
    let urlStudentAnnouncements: String
    
    //Initializer
    init(userID: Int) {
        self.userId = userID
        urlStudentInfoString = "https://summer-session-api.herokuapp.com/student/\(userId)/info"
        urlStudentTeamString = "https://summer-session-api.herokuapp.com/student/\(userId)/team"
        urlStudentAnnouncements = "https://summer-session-api.herokuapp.com/announcements"
    }
    
    // MARK: Method to retrieve Student from server or UserDefaults
    func getStudentInfo() -> Student? {
        let key = "studentInfo"
        //If Student already exists in UserDefaults, retrieve from UserDefaults
        if(checkUserDefaults(key: key, type: .Info)) {
            return decodeData(at: key, type: .Info) as? Student
        } else { //Information does not exist in UserDefaults
            //Get the information from the server
            return parse(specificURL: urlStudentInfoString, type: .Info) as? Student
        }
        //this should not be executed
    }
    
    // MARK: Method to retrieve Team from server or UserDefaults
    func getStudentTeam() -> Team? {
        let key = "studentTeam"
        print(type(of: Student.self))
        
        if(checkUserDefaults(key: key, type: .Team)) {
            return decodeData(at: key, type: .Team) as? Team
        } else {
            return parse(specificURL: urlStudentTeamString, type: .Team) as? Team
        }
    }
    
    // MARK: Method to get announcements from sever
    func getAnnouncements() -> Announcements? {
        if let url = URL(string: urlStudentAnnouncements) {
            if let data = try? Data(contentsOf: url) {
                if let json = try? decoder.decode(Announcements.self, from: data) {
                    return json
                }
            }
        }
        return nil
    }
    
    // MARK: - More helpful functions
    
    func updatedP<T: Decodable>(specificURL: String, key: String) throws -> T {
        if let url = URL(string: specificURL) {
            if let data = try? Data(contentsOf: url) {
                if let json = try? decoder.decode(T.self, from: data) {
                    defaults.set(data, forKey: key)
                    return json
                }
            }
        }
    }
    
    func parse(specificURL: String, type: DataType) -> Any {
        if let url = URL(string: specificURL) {
            if let data = try? Data(contentsOf: url) {
                switch type {
                case .Info:
                    let key = "studentInfo"
                    if let json = try? decoder.decode(Student.self, from: data) {
                        if let encodedUserDefaults = try? encoder.encode(json) {
                            defaults.set(encodedUserDefaults, forKey: key)
                        }
                        print("INFO from server successful")
                        return json
                    }
                case .Team:
                    let key = "studentTeam"
                    if let json = try? decoder.decode(Team.self, from: data) {
                        if let encodedUserDefaults = try? encoder.encode(json) {
                            defaults.set(encodedUserDefaults, forKey: key)
                        }
                        print("TEAM from server successful")
                        return json
                    }
                }
            }
        }
        print("I am about to return nothing")
        return (Any).self
    }
    
    func decodeData(at key: String, type: DataType) -> Any {
        if let decodedData = defaults.object(forKey: key) as? Data {
            switch type {
            case .Info:
                if let studentData = try? decoder.decode(Student.self, from: decodedData) {
                    print("Info from UD successful")
                    //print(studentData)
                    return studentData
                }
            case .Team:
                if let jsonTeam = try? decoder.decode(Team.self, from: decodedData) {
                    print("Team from UD successful")
                    //print(jsonTeam)
                    return jsonTeam
                }
            }
        }
        //Not expecting this to be called
        return (Any).self
    }

    //Method that checks whether the Student struct already exists in UserDefaults
    func checkUserDefaults(key: String, type: DataType) -> Bool {
        //Checking if the data exists in UserDefaults
        
        if let decodedData = defaults.object(forKey: key) as? Data {
            switch type {
            case .Info:
                if let _ = try? decoder.decode(Student.self, from: decodedData) {
                    return true
                }
            case .Team:
                if let _ = try? decoder.decode(Team.self, from: decodedData) {
                    return true
                }
            }
        }
        return false
    }
}
