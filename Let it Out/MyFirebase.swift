//
//  MyFirebase.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/1/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation
import Firebase

class MyFirebase {
    private let firebaseURL = "https://glaring-torch-8530.firebaseio.com"
    var rootRef : Firebase
    
    static let sharedInstance = MyFirebase()
    
    
    init() {
       rootRef = Firebase(url:firebaseURL)
    }
}