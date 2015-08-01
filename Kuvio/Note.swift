//
//  Note.swift
//  Kuvio
//
//  Created by Corné Driesprong on 26/07/15.
//  Copyright (c) 2015 DeltaLabs. All rights reserved.
//

import Foundation

struct Note {
    
    let pitch: Pitch
    let velocity: Velocity
    let duration: Int
    
    init(_ pitch: Pitch, velocity: Velocity = 127) {
        
        self.pitch = pitch
        self.velocity = velocity
        self.duration = 50
    }
}