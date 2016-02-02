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
    
    static func createRemote(name: String, password: String ) {
        MyFirebase.sharedInstance.rootRef.createUser(name, password: password,
        withValueCompletionBlock: { error, result in
        
            if error != nil {
                // There was an error creating the account
            } else {
                let uid = result["uid"] as? String
                print("Successfully created user account with uid: \(uid)")
            }
        })
    }
}