//
//  UIFont.swift
//  ING.Assignment
//
//  Created by Max Bondarenko on 2/11/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import UIKit

extension UIFont {

    class func fontIngRegular(size: Int)-> UIFont{
          return UIFont(name: "INGMe", size: CGFloat(size))!
    }
    
    class func fontIngBold(size: Int)-> UIFont{
        return UIFont(name: "INGMe-Bold", size: CGFloat(size))!
    }
    
}
