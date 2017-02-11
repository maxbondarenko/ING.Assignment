//
//  ArtistDTO.swift
//  Radiodrome
//
//  Created by Max Bondarenko on 12/29/16.
//  Copyright © 2016 MBKO. All rights reserved.
//

import UIKit

class AccountDTO {


    var balanceInCents: NSNumber = 0
    var currency: AccountCurrency?
    var id: NSNumber = 0
    var name: String = ""
    var number: NSNumber = 0
    var type: AccountType?
    var alias: String = ""
    var isVisible: Bool = true
    var iban: String = ""
    
    var linkedAccountId: NSNumber?
    var productName: String?
    var productType: NSNumber?
    var savingsTargetReached: Bool?
    var targetAmountInCents: NSNumber?
    
    func populateObject(dict: NSDictionary) -> AccountDTO? {
        
        
        self.balanceInCents = (dict["accountBalanceInCents"] as? NSNumber) ?? 0
        self.currency = AccountCurrency(rawValue: (dict["accountCurrency"] as? String)!)
        self.id = (dict["accountId"] as? NSNumber) ?? 0
        self.name = (dict["accountName"] as? String) ?? ""
        self.number = (dict["accountNumber"] as? NSNumber) ?? 0
        self.type = AccountType(rawValue: (dict["accountType"] as? String)!)
        self.alias = (dict["alias"] as? String) ?? ""
        self.isVisible = (dict["isVisible"] as? Bool) ?? true
        self.iban = (dict["iban"] as? String) ?? ""
        
        self.linkedAccountId = (dict["linkedAccountId"] as? NSNumber)
        self.productName = (dict["productName"] as? String)
        self.productType = (dict["productType"] as? NSNumber)
        self.savingsTargetReached = (dict["savingsTargetReached"] as? Bool)
        self.targetAmountInCents = (dict["targetAmountInCents"] as? NSNumber)
        
        return self
        
    }
    
    
}
