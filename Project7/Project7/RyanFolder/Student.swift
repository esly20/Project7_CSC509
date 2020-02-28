//
//  Student.swift
//  Project7
//
//  Created by Ryan Mai on 2/24/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import Foundation

struct Student: Codable {
    var firstname: String
    var lastname: String
    var email: String
    var cluster: String
    var dorm: String
    var boarder: Bool
    var program: String
}
