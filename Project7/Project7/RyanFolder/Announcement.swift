//
//  Announcement.swift
//  Project7
//
//  Created by Ryan Mai on 2/28/20.
//  Copyright © 2020 CSC509. All rights reserved.
//

import Foundation

struct Announcement: Codable {
    var announcementid: Int
    var senderlastname: String?
    var senderfirstname: String
    var program: String
    var body: String
}
