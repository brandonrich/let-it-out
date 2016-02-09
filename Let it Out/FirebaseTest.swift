//
//  FirebaseTest.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/1/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation
import Firebase

// Create a reference to a Firebase location
var myRootRef = Firebase(url:"https://<YOUR-FIREBASE-APP>.firebaseio.com")
// Write data to Firebase
myRootRef.setValue("Do you have data? You'll love Firebase.")