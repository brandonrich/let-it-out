//
//  Event.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/5/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation
import Firebase

class Event : CustomStringConvertible {
    var uid : String?
    var mood : Mood
    var emotion : Emotion?
    var reason : String
    var detail : String
    var dateTime : NSDate
    
    let savedDateFormat = "MMddYYYYHHmmss"
    
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

    
    init(snapshot: FDataSnapshot) {
        uid = snapshot.key
        reason = snapshot.value["reason"] as! String
        detail = snapshot.value["detail"] as! String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = savedDateFormat
        dateTime = formatter.dateFromString(uid!)!
        

        let spec = EmotionalSpectrum()
        let moodName = snapshot.value["mood"] as! String
        let mood = spec.moodWithName(moodName)
        self.mood = mood!
        
        let emotionValue = snapshot.value["emotionValue"] as! Int
        emotion = (mood?.emotionWithValue(emotionValue))
    }
    
    func persistForUserID(uid : String) {
        let ref = MyFirebase.sharedInstance.rootRef.childByAppendingPath("users").childByAppendingPath(uid)
        
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = savedDateFormat
        let eventRef = ref.childByAppendingPath("events").childByAppendingPath(formatter.stringFromDate(self.dateTime))
        
        // credit http://www.raywenderlich.com/109706/firebase-tutorial-getting-started
        eventRef.setValue(self.toAnyObject())
    }
    
    func toAnyObject() -> AnyObject {
        return [
            "mood":mood.name,
            "emotion": emotion!.toAnyObject(),
            "reason": reason,
            "detail": detail,
            "emotionValue": emotion!.value
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