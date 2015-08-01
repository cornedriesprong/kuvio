//
//  ChordView.swift
//  Kuvio
//
//  Created by Corné Driesprong on 26/07/15.
//  Copyright (c) 2015 DeltaLabs. All rights reserved.
//

import UIKit

class ChordView: UIView {

    var pitchClass: PitchClass!
    var trianglePath: UIBezierPath?
    
    override func drawRect(rect: CGRect) {
        
        let FirstNoteColor = pitchClass.color.CGColor
        let ThirdNoteColor = pitchClass.interval(.Major3rd)!.color.CGColor
        let FifthNoteColor = pitchClass.interval(.Perfect5th)!.color.CGColor
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, 0))
        path.addLineToPoint(CGPointMake(0, blockSize))
        path.addLineToPoint(CGPointMake(blockSize, blockSize))
        path.closePath()
        path.fill()
        
        trianglePath = path
        
        path.addClip()
        
        let context = UIGraphicsGetCurrentContext()
        let colors = [FirstNoteColor, FifthNoteColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations:[CGFloat] = [0.0, 1.0]
        let gradient = CGGradientCreateWithColors(colorSpace,
            colors,
            colorLocations)
        var startPoint = CGPoint.zeroPoint
        var endPoint = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(context,
            gradient,
            startPoint,
            endPoint,
            0)
        
        let context2 = UIGraphicsGetCurrentContext()
        let colors2 = [UIColor.clearColor().CGColor, ThirdNoteColor]
        let colorSpace2 = CGColorSpaceCreateDeviceRGB()
        let colorLocations2: [CGFloat] = [0.0, 1.0]
        let gradient2 = CGGradientCreateWithColors(colorSpace2,
            colors2,
            colorLocations2)
        var startPoint2 = CGPoint.zeroPoint
        var endPoint2 = CGPoint(x:self.bounds.width, y:0)
        CGContextDrawLinearGradient(context2,
            gradient2,
            startPoint2,
            endPoint2,
            0)
    }
}
