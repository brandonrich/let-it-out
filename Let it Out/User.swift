//
//  User.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/1/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation
import Firebase

class User : CustomStringConvertible {
    
    private var loaded = false
    private var internal_uid = ""
    var uid : String {
        get{
            return internal_uid
        }
        set {
            print("Got uid: \(newValue). Time to query for stuff")
            if !loaded {
              load(newValue)
            }
            loaded = true
            internal_uid = newValue
        }
    }
    var name : String?
    
    // Times are stored internally as HHmm
    private var internalWakeUpTime : String = ""
    var wakeUpTime : String {
        get {
            return internalWakeUpTime
        }
        set {
            internalWakeUpTime = newValue.reformatTimeString("hh:mm a", toFormat: "HHmm")
        }
    }
    
    private var internalSleepTime : String = ""
    var sleepTime : String {
        get {
            return internalSleepTime
        }
        set {
            internalSleepTime = newValue.reformatTimeString("hh:mm a", toFormat: "HHmm")
        }
    }
    
    var events : [Event] = []

    func addEvent( event : Event ) {
        let ref = MyFirebase.sharedInstance.rootRef.childByAppendingPath("users").childByAppendingPath(uid)
        events.append(event)
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MdyyyyHHmms"
        let eventRef = ref.childByAppendingPath("events").childByAppendingPath(formatter.stringFromDate(event.dateTime))
        
        // credit http://www.raywenderlich.com/109706/firebase-tutorial-getting-started
        eventRef.setValue(event.toAnyObject())
        
        
    }
    
    func asDictionary() -> [String:String] {
        return ["name" : self.name ?? "",
                "wakeUpTime" : String(self.wakeUpTime),
                "sleepTime" : String(self.sleepTime)
                ]
    }

    
    func persist() {
        MyFirebase.sharedInstance.rootRef.childByAppendingPath("users")
            .childByAppendingPath(self.uid).setValue(self.asDictionary())
    }
    
    func load(uid:String) {
        let ref = MyFirebase.sharedInstance.rootRef.childByAppendingPath("users").childByAppendingPath(uid)
        ref.observeEventType(.Value, withBlock: {
            userData in
            print("Triggered! \(userData.key) -> \(userData.value)")
            self.name = userData.value["name"] as? String
            self.internalSleepTime = String(userData.value["sleepTime"])
            self.internalWakeUpTime = String(userData.value["wakeUpTime"])
            
            //var gotevents = userData.value["events"]
            
        })

    }
    
    static let currentUser = User()
    static func setCurrentUser(uid: String) {
        User.currentUser.uid = uid
    }

    var description : String {
        return "Name: \(name)\nWakeup: \(wakeUpTime)\nSleep: \(sleepTime)"
    }
    

}