//
//  CodeForOthers.swift
//  Project7
//
//  Created by Mark Witt on 2/28/20.
//  Copyright © 2020 CSC509. All rights reserved.
//



import Foundation
import UIKit


import UserNotifications
//app delegate
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (granted, error) in
    }
    return true
}


//main view controller
func notificationStuff(){
     let signInContent = UNMutableNotificationContent()
    signInContent.title = "Sign-In"
    signInContent.body = "You have 5 minutes to sign-in to your dorm"
    signInContent.sound = UNNotificationSound.default
    
    let signInDateComponents = DateComponents(calendar: Calendar.current,  hour: 9 , minute: 25, weekday: 0 )
    let mondaySignInTrigger =  UNCalendarNotificationTrigger(dateMatching: signInDateComponents, repeats: false)
    
    let mondayRequest = UNNotificationRequest(identifier: "mondayIdentifier", content: signInContent, trigger: mondaySignInTrigger)
    
    UNUserNotificationCenter.current().add(mondayRequest, withCompletionHandler: nil)
 }
