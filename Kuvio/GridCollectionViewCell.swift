//
//  GridCollectionViewCell.swift
//  Kuvio
//
//  Created by Corné Driesprong on 26/07/15.
//  Copyright (c) 2015 DeltaLabs. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var noteView: NoteView!
    @IBOutlet weak var chordView: ChordView!

    static let identifier = "GridCollectionViewCell"
    
    var pitchClass: PitchClass! {
        didSet {
            noteView.pitchClass = pitchClass
            chordView.pitchClass = pitchClass
        }
    }
    
    var root: Pitch {
        return pitchClass.rawValue + rootOffset
    }
    
    var majorTriad: [Pitch] {
        return Chord(root: root).majorTriad
    }
    
    var minorTriad: [Pitch] {
        return Chord(root: root).minorTriad
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        
        let noteController = NoteController.sharedInstance
        
        if (CGRectContainsPoint(noteView!.frame, point)) {
            let note = Note(root, velocity: 127)
            noteController.playNote(note)
            return true
        } else if (chordView!.trianglePath!.containsPoint(point)) {
            for pitch in majorTriad {
                let note = Note(pitch, velocity: 127)
                noteController.playNote(note)
            }
            return true
        } else if (CGRectContainsPoint(self.bounds, point)) {
            for pitch in minorTriad {
                let note = Note(pitch, velocity: 127)
                noteController.playNote(note)
            }
            return true
        }
        return false
    }
}
