//
//  Mood.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 1/31/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation

class Mood : CustomStringConvertible {
    internal var name : String
    private var emotions : [Emotion]
    
    init(name: String) {
        self.name = name
        emotions = []
    }
    
    func addEmotion( emotion: Emotion )  {
        emotions.append(emotion)
    }
    
    func emotionCount() -> Int {
        return emotions.count
    }
    
    func emotionAt( index : Int ) -> Emotion {
        return emotions[index]
    }
    
    var description : String {
        return name
    }
}