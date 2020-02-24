//
//  Student.swift
//  Project7
//
//  Created by Ryan Mai on 2/24/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import Foundation

struct Student: Codable {
    var name: String
    var preferredName: String
    var email: String
    var boarder: Bool
    var dorm: String?
    var cluster: String
    var program: String
    var prepaidCollege: Bool

    var classOne: Class
    var classTwo: Class
    var afternoonActivity: Class
}
