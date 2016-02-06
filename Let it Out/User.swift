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
    
    var name : String
    var wakeUpTime : Int
    var sleepTime : Int
    var events : [Event] = []
    
    init(name: String, wakeUpTime : Int, sleepTime: Int ) {
        self.name = name
        self.wakeUpTime = wakeUpTime
        self.sleepTime = sleepTime
    }

}