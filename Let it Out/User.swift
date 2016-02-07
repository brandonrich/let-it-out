//
//  User.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/1/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation
import Firebase

class User {
    
    private var internal_uid = ""
    var uid : String {
        get{
            return internal_uid
        }
        set {
            print("Got uid: \(newValue). Time to query for stuff")
            internal_uid = newValue
        }
    }
    var name : String?
    var wakeUpTime : Int?
    var sleepTime : Int?
    var events : [Event] = []
    
    func asDictionary() -> [String:String] {
        return ["foo":"bar"]
      /*
        return ["name" : self.name,
                "wakeUpTime" : String(self.wakeUpTime),
                "sleepTime" : String(self.sleepTime)
                ]
*/
    }
    
    static let currentUser = User()
    static func setCurrentUser(uid: String) {
        User.currentUser.uid = uid
    }

}