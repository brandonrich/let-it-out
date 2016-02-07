//
//  Event.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/5/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation

class Event : CustomStringConvertible {
    var mood : Mood
    var emotion : Emotion
    var reason : String
    var detail : String
    var dateTime : NSDate
    
    init(mood:Mood, emotion:Emotion, reason:String, detail:String) {
        self.mood=mood
        self.emotion=emotion
        self.reason=reason
        self.detail=detail
        self.dateTime = NSDate()
    }
    
    var description : String {
        return "Mood: \(mood)\n" +
               "Emotion: \(emotion)\n" +
               "Reason: \(reason)\n" +
               "Detail: \(detail)"
    }
}