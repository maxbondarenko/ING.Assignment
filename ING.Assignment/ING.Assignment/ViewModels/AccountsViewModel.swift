//
//  AccountsViewModel.swift
//  ING.Assignment
//
//  Created by Max Bondarenko on 8/11/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

class AccountsViewModel: NSObject {

    let accountSet = Variable<AccountSet>.init(AccountSet())
    
    let tableViewItems = Variable<[SectionModel<String, Account>]>.init([])
    
    let disposeBag = DisposeBag()
    
    var editMode = Variable<Bool>.init(false)
    
    
     override init(){

        super.init()
        
        var joinedObserver = Observable.combineLatest(editMode.asObservable(),self.accountSet.asObservable())
        
        joinedObserver.subscribe { (event) in


            
            if let accountSet = event.element?.1{
                
                var accounsPayment : [Account] = accountSet.paymentAccounts
                if(!self.editMode.value){
                    accounsPayment = Account.filterVisibleAccounts(accountSet.paymentAccounts)
                }
                var accounsSavings : [Account] = accountSet.savingAccounts
                if(!self.editMode.value){
                    accounsSavings = Account.filterVisibleAccounts(accountSet.savingAccounts)
                }
                
                let section1 = SectionModel(model: "Payment Accounts", items: accounsPayment)
                let section2 = SectionModel(model: "Savings Accounts", items: accounsSavings)
                let res =
                    [section1, section2]
                
                
                
                self.tableViewItems.value = res
                
            }
            }.disposed(by: self.disposeBag)
        
        self.accountSet.value = AccountSet()
    }
    
    

    

    
    
    
}
