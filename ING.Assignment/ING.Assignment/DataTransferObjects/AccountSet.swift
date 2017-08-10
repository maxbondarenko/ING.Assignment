

import UIKit

class AccountSet: NSObject {

    var accounts: [Account] = []
    var paymentAccounts: [Account] = []
    var savingAccounts: [Account] = []
    
    var returnCode: ReturnCode?
    var failedAccountTypes: String = ""
    
    func connectLinkedAccounts(){
        for account in savingAccounts{
            if account.linkedAccountId != nil{
                account.linkedAccount = paymentAccounts.first(where: {$0.id == account.linkedAccountId})
            }
        }
    }
    
    func populateAccounts(dict: NSDictionary){
        let accountsDict = dict["accounts"] as? Array<[String: AnyObject]>
        
        if(accountsDict != nil){
            for accountDict in accountsDict!
            {
                let account : Account = Account().populate(dict: accountDict as NSDictionary)!
                self.accounts.append(account)
                
                if(account.type == AccountType.payment){
                    paymentAccounts.append(account)
                }
                else if(account.type == AccountType.saving){
                    savingAccounts.append(account)
                }
            }
        }
    }
    
    func populate(dict: NSDictionary) -> AccountSet? {

        self.populateAccounts(dict:dict)
        self.connectLinkedAccounts()
        
        self.failedAccountTypes = (dict["failedAccountTypes"] as? String)!
        self.returnCode = ReturnCode(rawValue: (dict["returnCode"] as? String)!)
        
        return self
        
    }
}
