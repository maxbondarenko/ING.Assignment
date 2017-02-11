//
//  UIColor.swift
//  Radiodrome
//
//  Created by Max Bondarenko on 11/5/16.
//  Copyright © 2016 MBKO. All rights reserved.
//

import UIKit

extension UIColor{
    
    class func rgbColor(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    //Palette colors are defined here starting with prefix ing
    class func ingOrange() -> UIColor{
        return UIColor.rgbColor(rgbValue: 0xff5812)
    }
    class func ingLightGray() -> UIColor{
        return UIColor.rgbColor(rgbValue: 0xeeeeee)
    }
}
