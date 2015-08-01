//
//  KuvioColors.swift
//  Kuvio
//
//  Created by Corné Driesprong on 26/07/15.
//  Copyright (c) 2015 DeltaLabs. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 08) / 255.0
        let b = CGFloat((hex & 0x0000FF) >> 00) / 255.0
        self.init(red:r, green:g, blue:b, alpha:alpha)
    }
    
    class func kuvioLightGreen(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0x81C540, alpha: alpha) }
    class func kuvioLightMagenta(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0xEB225E, alpha: alpha) }
    class func kuvioBlue(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0x1674BD, alpha: alpha) }
    class func kuvioRed(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0xBA2804, alpha: alpha) }
    class func kuvioDarkPurple(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0x350C59, alpha: alpha) }
    class func kuvioDarkYellow(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0xC28400, alpha: alpha) }
    class func kuvioPurple(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0x8F005A, alpha: alpha) }
    class func kuvioDarkGreen(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0x4F9111, alpha: alpha) }
    class func kuvioOrange(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0xED5A34, alpha: alpha) }
    class func kuvioLightPurple(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0x602E8D, alpha: alpha) }
    class func kuvioLightYellow(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0xF5B52E, alpha: alpha) }
    class func kuvioDarkMagenta(alpha: CGFloat = 1.0) -> UIColor { return UIColor(hex: 0xC32287, alpha: alpha) }
}