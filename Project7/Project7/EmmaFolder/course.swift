//
//  course.swift
//  Project7
//
//  Created by student on 2/28/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import Foundation

struct Course: Codable {
    var courseid: Int
    var studentid: Int
    var name: String
    var time_start: String
    var time_end: String
    var instructor: String
    var location: String
    var period: String

}

let encoder = JSONEncoder()
if let encoded = try? encoder.encode(Course) {
    let defaults = UserDefaults.standard
    defaults.set(encoded, forKey: "SavedPerson")
}
