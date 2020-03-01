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
    let urlStudentAnnouncements: String
    let urlStudentSchedule: String
    
    //Initializer
    init(userID: Int) {
        self.userId = userID
        urlStudentInfoString = "https://summer-session-api.herokuapp.com/student/\(userId)/info"
        urlStudentTeamString = "https://summer-session-api.herokuapp.com/student/\(userId)/team"
        urlStudentAnnouncements = "https://summer-session-api.herokuapp.com/announcements"
        urlStudentSchedule = "https://summer-session-api.herokuapp.com/student/\(userId)/schedule"
    }
    
    // MARK: Method to retrieve Student from server or UserDefaults
    func getStudentInfo() -> Student? {
        let key = "studentInfo"
        //If Student already exists in UserDefaults, retrieve from UserDefaults
        if(checkUserDefaults(key: key)) {
            return decodeData(key: key, type: Student.self)
        } else { //Information does not exist in UserDefaults
            //Get the information from the server
            return parse(specificURL: urlStudentInfoString, key: key, type: Student.self)
        }
    }
    
    // MARK: Method to retrieve Team from server or UserDefaults
    func getStudentTeam() -> Team? {
        let key = "studentTeam"
        if(checkUserDefaults(key: key)) {
            return decodeData(key: key, type: Team.self)
        } else {
            return parse(specificURL: urlStudentTeamString, key: key, type: Team.self)
        }
    }
    
    // MARK: Method to get announcements from sever
    func getAnnouncements() -> Announcements? {
        return parse(specificURL: urlStudentAnnouncements, key: "Announcements", type: Announcements.self)
    }
    
    // MARK: Method to get student schedule
    func getSchedule() -> Schedule? {
        let key = "studentSchedule"
        if(checkUserDefaults(key: key)) {
            return decodeData(key: key, type: Schedule.self)
        } else {
            return parse(specificURL: urlStudentSchedule, key: key, type: Schedule.self)
        }
    }
    
    // MARK: - More helpful functions
    
    // MARK: Method parses data from URL
    func parse<T: Decodable>(specificURL: String, key: String, type: T.Type) -> T? {
        guard let url = URL(string: specificURL) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        guard let json = try? decoder.decode(type, from: data)  else { return nil }
        print("Data from server successful")
        
        defaults.set(data, forKey: key)
        return json
    }
    
    // MARK: Method decodes data from UD
    func decodeData<T: Decodable>(key: String, type: T.Type) -> T? {
        guard let encodedData = defaults.object(forKey: key) as? Data else { return nil }
        guard let decodedData = try? decoder.decode(type, from: encodedData) else { return nil }
        print("Data from UD successful")
        
        return decodedData
    }

    // MARK: Method that checks whether the Student struct already exists in UserDefaults
    func checkUserDefaults(key: String) -> Bool {
        //Checking if the data exists in UserDefaults
        if let _ = defaults.object(forKey: key) as? Data {
            return true
        }
        return false
    }
    
}
