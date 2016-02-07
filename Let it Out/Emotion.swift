//
//  Emotion.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 1/31/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation

class Emotion : CustomStringConvertible {
    
    var name : String
    var value : Int
    var emoji : String
    
    init(name: String, value: Int, emoji: String){
        self.name = name
        self.value = value
        self.emoji = emoji
    }
    
    var description : String {
        return "\(name): \(emoji)"
    }
}