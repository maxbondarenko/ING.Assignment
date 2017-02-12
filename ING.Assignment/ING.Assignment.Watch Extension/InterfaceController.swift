//
//  InterfaceController.swift
//  ING.Assignment.Watch Extension
//
//  Created by Max Bondarenko on 2/12/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import WatchKit
import Foundation



class InterfaceController: WKInterfaceController {

    
    @IBOutlet var tableAccounts: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        ApiStub().stubGetAccounts()
        Api.getAccounts()
            .then { (accounts: AccountSetDTO) -> () in
                
                ApiStub().clearStubs()
                let visibleAccounts = AccountDTO.filterVisibleAccounts(accounts.accounts)
                
                self.tableAccounts.setNumberOfRows(visibleAccounts.count, withRowType: "AccountRowController")
                
                var i = 0
                for account in visibleAccounts
                {
                    let row = self.tableAccounts.rowController(at: i) as! AccountRowController
                    row.txtIban.setText(account.iban)
                    row.txtAmount.setText(account.getCurrencySign() + " " + account.getBalanceEuros() + ",")
                    
                    row.txtAmountCents.setText(account.getBalanceRemainderCents())
                    
                    row.txtAccountName.setText(account.name)
                    
                    if(account.linkedAccount != nil){
                        row.txtAccountName.setText(account.linkedAccount?.name ?? "")
                        row.txtIban.setText(account.linkedAccount?.iban ?? "")
                    }
                    i = i + 1
                }
                
                
                
            }.catch
            { error in
                
                ApiStub().clearStubs()
                
                
        }
        
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
