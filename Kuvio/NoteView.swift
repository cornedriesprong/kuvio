//
//  NoteView.swift
//  Kuvio
//
//  Created by Corné Driesprong on 26/07/15.
//  Copyright (c) 2015 DeltaLabs. All rights reserved.
//

import UIKit

class NoteView: UIView {

    var pitchClass: PitchClass!
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: rect)
        pitchClass.color.setFill()
        path.fill()
    }
}
