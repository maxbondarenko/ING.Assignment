

import WatchKit
import Foundation
import RxSwift


class InterfaceController: WKInterfaceController {

    let disposeBag = DisposeBag()
    
    @IBOutlet var tableAccounts: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        ApiStub().stubGetAccounts()
        Api.getAccounts().subscribe(){ result in
            
            ApiStub().clearStubs()
            if(result.error != nil){
                //handle error and return
                return
            }
            
            let accounts = result.element
            
            let visibleAccounts = Account.filterVisibleAccounts((accounts?.accounts)!)
            
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
        }.disposed(by: self.disposeBag)
        
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
