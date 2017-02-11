//
//  TrackFavoriteStatus.swift
//  Radiodrome
//
//  Created by Max Bondarenko on 1/17/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import UIKit

enum AccountType: String {
    case payment = "PAYMENT"
    case saving = "SAVING"
    
    func getGroupTitle()->String{
        if(self == .payment){
            return "Payment accounts"
        }
        else if(self == .saving){
            return "Saving accounts"
        }
        
        return "Unknown account type"
    }
    
    static func casesCount() -> Int{
        //ALWAYS UPDATE THIS WHEN THE COUNT CHANGES
        return 2
    }
}
