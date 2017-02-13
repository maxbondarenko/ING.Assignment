//
//  ArtistDTO.swift
//  Radiodrome
//
//  Created by Max Bondarenko on 12/29/16.
//  Copyright © 2016 MBKO. All rights reserved.
//

import UIKit
import Darwin

class AccountDTO {

    var balanceInCents: Int64 = 0
    var currency: AccountCurrency?
    var id: NSNumber = 0
    var name: String = ""
    var number: NSNumber = 0
    var type: AccountType?
    var alias: String = ""
    var isVisible: Bool = true
    var iban: String = ""
    
    var linkedAccountId: NSNumber?
    weak var linkedAccount: AccountDTO?
    
    
    var productName: String?
    var productType: NSNumber?
    var savingsTargetReached: Bool?
    var targetAmountInCents: Int64?
    
    class func filterVisibleAccounts(_ accounts:[AccountDTO]) -> [AccountDTO]
    {
        return accounts.filter({ $0.isVisible == true }) 
    }
    
    func getCurrencySign()->String{
        if(self.currency == AccountCurrency.eur){
            return "€"
        }
        
        else{
            return ""
        }
    }
    
    func getBalanceEuros()->String{
        
        let floored = String(format: "%.0f", floor(Double(self.balanceInCents) / 100.0))
        return floored

    }
    
    func getBalanceRemainderCents() -> String{
        
        let f = NumberFormatter()
        
        f.negativePrefix = ""
        
        f.decimalSeparator = ""
        f.maximumIntegerDigits = 0
        f.maximumFractionDigits = 2
        f.minimumFractionDigits = 2
        
        let number = Double(self.balanceInCents) / 100.0
        let res = f.string(from: NSNumber(value: number))
        
        return res ?? "00"
        
    }
    
    func populate(dict: NSDictionary) -> AccountDTO? {
        
        
        self.balanceInCents = (dict["accountBalanceInCents"] as? Int64) ?? 0
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
        self.targetAmountInCents = (dict["targetAmountInCents"] as? Int64)
        
        return self
        
    }
    
    
}
