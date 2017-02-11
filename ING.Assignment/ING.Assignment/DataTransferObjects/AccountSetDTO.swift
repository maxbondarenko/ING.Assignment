//
//  AccountSetDTO.swift
//  ING.Assignment
//
//  Created by Max Bondarenko on 2/10/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import UIKit

class AccountSetDTO: NSObject {

    var accounts: [AccountDTO] = []
    var returnCode: ReturnCode?
    var failedAccountTypes: String = ""
    
    
    func populateObject(dict: NSDictionary) -> AccountSetDTO? {
        
        let accountsDict = dict["accounts"] as? Array<[String: AnyObject]>
        
        if(accountsDict != nil){
            for accountDict in accountsDict!
            {
                let account : AccountDTO = AccountDTO().populateObject(dict: accountDict as NSDictionary)!
                self.accounts.append(account)
            }
        }
        
        self.failedAccountTypes = (dict["failedAccountTypes"] as? String)!
        self.returnCode = ReturnCode(rawValue: (dict["returnCode"] as? String)!)
        
        return self
        
    }
}
