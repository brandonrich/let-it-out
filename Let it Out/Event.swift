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
    
    func toAnyObject() -> AnyObject {
        return [
            "mood":mood.name,
            "emotion": emotion.toAnyObject(),
            "reason": reason,
            "detail": detail
        ]
        /*
        return [
            "mood":mood.name,
            "emotionValue": emotion.value,
            "emotionName": emotion.name,
            "emotionEmoji": emotion.emoji,
            "reason": reason,
            "detail": detail
        ]
*/
    }
    
    var dateString : String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "M/d/yyyy hh:mm a"
        return formatter.stringFromDate(self.dateTime)
    }
}