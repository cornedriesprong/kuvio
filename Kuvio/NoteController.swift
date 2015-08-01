//
//  NoteController.swift
//  Kuvio
//
//  Created by Corné Driesprong on 26/07/15.
//  Copyright (c) 2015 DeltaLabs. All rights reserved.
//

import Foundation
import UIKit

class NoteController {
    
    static let sharedInstance = NoteController()
    var notes: [Note]
    
    init() {
        notes = []
    }
    
    func noteOn(note: Note) {
        notes.append(note)
    }
        
    func playNote(note: Note) {
        
        let pitch: UInt8 = UInt8(note.pitch)
        let velocity: UInt8 = UInt8(note.velocity)
        
        let noteOn: [UInt8] = [ 0x90, pitch, velocity ]
        let noteOff: [UInt8] = [ 0x80, pitch, 0 ]
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        delegate.midi!.sendBytes(noteOn, size:UInt32(sizeofValue(noteOn)))
        NSThread.sleepForTimeInterval(0.1)
        delegate.midi!.sendBytes(noteOff, size:UInt32(sizeofValue(noteOff)))
    }
}