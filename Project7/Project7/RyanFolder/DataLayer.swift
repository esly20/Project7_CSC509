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
    // Variable declaration
    let defaults = UserDefaults.standard
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    var userId: Int
    let urlStudentInfoString: String
    let urlStudentTeamString: String
    let urlStudentAnnouncements: String
    let urlStudentSchedule: String
    let urlStudentActivities: String
    let urlActivities: String = "https://summer-session-api.herokuapp.com/activities"
    
    //Initializers
    init(userID: Int) {
        self.userId = userID
        urlStudentInfoString = "https://summer-session-api.herokuapp.com/student/\(userId)/info"
        urlStudentTeamString = "https://summer-session-api.herokuapp.com/student/\(userId)/team"
        urlStudentAnnouncements = "https://summer-session-api.herokuapp.com/announcements"
        urlStudentSchedule = "https://summer-session-api.herokuapp.com/student/\(userId)/schedule"
        urlStudentActivities = "https://summer-session-api.herokuapp.com/student/\(userId)/activities"
    }
    
    init() {
        userId = defaults.integer(forKey: "user")
        urlStudentInfoString = "https://summer-session-api.herokuapp.com/student/\(userId)/info"
        urlStudentTeamString = "https://summer-session-api.herokuapp.com/student/\(userId)/team"
        urlStudentAnnouncements = "https://summer-session-api.herokuapp.com/announcements"
        urlStudentSchedule = "https://summer-session-api.herokuapp.com/student/\(userId)/schedule"
        urlStudentActivities = "https://summer-session-api.herokuapp.com/student/\(userId)/activities"
    }
    
    // Updates User ID
    func updateUserId(newUserId: Int) {
        self.userId = newUserId
    }
    
    // MARK: Method to retrieve Student from server or UserDefaults
    func getStudentInfo() -> Student? {
        let key = "student\(userId)Info"
        if(checkUserDefaults(key: key)) {
            return decodeData(key: key, type: Student.self)
        } else {
            //Get the information from the server
            return parse(specificURL: urlStudentInfoString, key: key, type: Student.self)
        }
    }
    
    // MARK: Method to retrieve Team from server or UserDefaults
    func getStudentTeam() -> Team? {
        let key = "student\(userId)Team"
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
        let key = "student\(userId)Schedule"
        if(checkUserDefaults(key: key)) {
            return decodeData(key: key, type: Schedule.self)
        } else {
            return parse(specificURL: urlStudentSchedule, key: key, type: Schedule.self)
        }
    }
    
    // MARK: Method to get student activity
    func getStudentActivities() -> Activities? {
        return parse(specificURL: urlStudentActivities, key: "student\(userId)Activities", type: Activities.self)
    }
    
    // MARK: Method to get Acitivities
    func getActivities() -> Activities? {
        return parse(specificURL: urlActivities, key: "activities", type: Activities.self)
    }
    
    // MARK: - Functions for parsing and decoding data below
    
    // MARK: Method parses data from URL
    func parse<T: Decodable>(specificURL: String, key: String, type: T.Type) -> T? {
        guard let url = URL(string: specificURL) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        guard let json = try? decoder.decode(type, from: data)  else { return nil }
        ///print("Data from server successful")
        defaults.set(data, forKey: key)
        return json
    }
    
    // MARK: Method decodes data from UD
    func decodeData<T: Decodable>(key: String, type: T.Type) -> T? {
        guard let encodedData = defaults.object(forKey: key) as? Data else { return nil }
        guard let decodedData = try? decoder.decode(type, from: encodedData) else { return nil }
        ///print("Data from UD successful")
        return decodedData
    }

    // MARK: Method that checks whether the Student struct already exists in UserDefaults
    func checkUserDefaults(key: String) -> Bool {
        if let _ = defaults.object(forKey: key) as? Data {
            return true
        }
        return false
    }
}
