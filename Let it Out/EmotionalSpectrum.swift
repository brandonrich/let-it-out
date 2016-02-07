//
//  EmotionalSpectrum.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 1/31/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import Foundation

class EmotionalSpectrum {
    
    var moods : [Mood]
    
    init() {
        moods = []
        let positive = Mood(name: "Positive")
        positive.addEmotion( Emotion(name: "Excitement", value: 3, emoji: "😄") )
        positive.addEmotion( Emotion(name: "Laughter", value: 2, emoji: "😂") )
        positive.addEmotion( Emotion(name: "Peace", value: 1, emoji: "😇") )
        let neutral = Mood(name: "Neutral")
        let negative = Mood(name: "Negative")
        negative.addEmotion( Emotion(name: "Sadness", value: -1, emoji: "😔") )
        negative.addEmotion( Emotion(name: "Anxiety", value: -2, emoji: "😕") )
        negative.addEmotion( Emotion(name: "Anger", value: -3, emoji: "😡") )
        moods = [positive,neutral,negative]
    }
    
}