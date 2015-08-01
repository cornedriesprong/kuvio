//
//  KuvioTypes.swift
//  Kuvio
//
//  Created by Corné Driesprong on 26/07/15.
//  Copyright (c) 2015 DeltaLabs. All rights reserved.
//

import Foundation
import UIKit

typealias Pitch = Int
typealias Velocity = Int

let blockSize = UIScreen.mainScreen().bounds.size.width / 6
let rootOffset: Pitch = 48 // C3

extension Pitch {
    
    func interval(interval: Interval) -> Pitch {
        return self + interval.rawValue
    }
    
    func pitchClass() -> PitchClass? {
        
        let modPitch = self % 12
        
        for pitchClass in PitchClass.allObjects {
            if pitchClass.rawValue == modPitch {
                return pitchClass
            }
        }
        return nil
    }
}

enum PitchClass: Int {
    case C
    case Cis
    case D
    case Dis
    case E
    case F
    case Fis
    case G
    case Gis
    case A
    case Ais
    case B
    
    static let allObjects = [C, Cis, D, Dis, E, F, Fis, G, Gis, A, Ais, B]
}
    
extension PitchClass {
    
    func interval(interval: Interval) -> PitchClass? {
        
        for p in PitchClass.allObjects {
            if p.rawValue == (self.rawValue + interval.rawValue) % 12 {
                return p
            }
        }
        return nil
    }
}

extension PitchClass {
    
    var color: UIColor {
        switch self {
            case .C:
                return UIColor.kuvioBlue()
            case .Cis:
                return UIColor.kuvioDarkGreen()
            case .D:
                return UIColor.kuvioDarkMagenta()
            case .Dis:
                return UIColor.kuvioDarkPurple()
            case .E:
                return UIColor.kuvioDarkYellow()
            case .F:
                return UIColor.kuvioLightGreen()
            case .Fis:
                return UIColor.kuvioLightMagenta()
            case .G:
                return UIColor.kuvioLightPurple()
            case .Gis:
                return UIColor.kuvioLightYellow()
            case .A:
                return UIColor.kuvioOrange()
            case .Ais:
                return UIColor.kuvioPurple()
            case .B:
                return UIColor.kuvioRed()
        }
    }
}

enum Interval: Int {
    case Minor2nd
    case Major2nd
    case Minor3rd
    case Major3rd
    case Perfect4th
    case Tritone
    case Perfect5th
    case Minor6th
    case Major6th
    case Minor7th
    case Major7th
    
}

struct Chord {
    
    let root: Pitch
    
    var majorTriad: [Pitch] {
        let third = root.interval(.Major3rd)
        let fifth = root.interval(.Perfect5th)
        let chordArray = [root, third, fifth]
        return chordArray
    }
    
    var minorTriad: [Pitch] {
        let third = root.interval(.Minor3rd)
        let fifth = root.interval(.Perfect5th)
        let chordArray = [root, third, fifth]
        return chordArray
    }
    
    init(root: Pitch) {
        self.root = root
    }
}