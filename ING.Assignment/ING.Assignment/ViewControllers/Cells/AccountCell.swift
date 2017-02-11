//
//  AccountCell.swift
//  ING.Assignment
//
//  Created by Max Bondarenko on 2/11/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import UIKit
import Fontello_Swift

class AccountCell: UITableViewCell {

    var account: AccountDTO?
    
    @IBOutlet weak var txtAccountName: UILabel!
    
    @IBOutlet weak var txtAccountIban: UILabel!
    
    @IBOutlet weak var txtAmountCents: UILabel!
    
    @IBOutlet weak var txtAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func populateCell(account: AccountDTO){
        self.account = account
        
        if(account.linkedAccount != nil){
            self.txtAccountName.text = account.linkedAccount?.name ?? ""
            self.txtAccountIban.text = account.linkedAccount?.iban ?? ""
        }
        else{
            self.txtAccountName.text = account.name
            self.txtAccountIban.text = account.iban
        }
        
        self.txtAmount.text = account.getCurrencySign() + " " + account.getBalanceEuros() + ","
        
        if(account.savingsTargetReached == true){
            let balanceWithCheck = NSAttributedString()
                .appendFontEntypo(icon: Entypo.Check, size: 17, color: .ingOrange())
                .appendIngMe(text: " " + (self.txtAmount.text ?? ""), size: 17, color: .black)
            self.txtAmount.attributedText = balanceWithCheck
        }
        
        self.txtAmountCents.text = account.getBalanceRemainderCents()
        
        self.makeBottomBorder(color: UIColor.ingLightGray())
    }

}
