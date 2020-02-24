//
//  Class.swift
//  Project7
//
//  Created by Ryan Mai on 2/24/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import Foundation

struct Class: Codable {
    var name: String
    var teacher: Faculty
    var startTime: String
    var endTime: String
    var period: String
}
