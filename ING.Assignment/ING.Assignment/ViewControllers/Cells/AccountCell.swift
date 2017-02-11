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
    var editMode = false
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var txtAccountName: UILabel!
    
    @IBOutlet weak var txtAccountIban: UILabel!
    
    @IBOutlet weak var txtAmountCents: UILabel!
    
    @IBOutlet weak var btnToggleHidden: UIButton!
    
    @IBOutlet weak var txtAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func refreshButtonToggleHidden(animated: Bool){
       
        btnToggleHidden.setTitle("", for: .normal)
        if(self.account?.isVisible == true){
            btnToggleHidden.removeOverlays()
            
            btnToggleHidden.addIconOverlayInTheCenter(icon: Entypo.Check, color: .white, bgColor: .ingOrange(), borderColor: .ingOrange(), animated: animated)
        }
        else{
            btnToggleHidden.removeOverlays()
            btnToggleHidden.addIconOverlayInTheCenter(icon: Entypo.Check, color: .white, bgColor: .white, borderColor: .ingOrange(), animated: animated)
        }
    }
    func toggleCheck(){
        self.account?.isVisible = !(self.account?.isVisible ?? false)
        refreshButtonToggleHidden(animated: true)
    }
    func populateCell(account: AccountDTO, editMode: Bool){
        self.account = account
        self.editMode = editMode
        
        
        refreshButtonToggleHidden(animated: false)
        self.btnToggleHidden.addTarget(self, action: #selector(toggleCheck), for: UIControlEvents.touchUpInside)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut, animations: {
                        
                        if(editMode){
                            self.txtAmount.alpha = 0.0
                            self.txtAmountCents.alpha = 0.0
                            self.btnToggleHidden.alpha = 1.0
                            
                            self.viewContainer.transform = CGAffineTransform(translationX: self.btnToggleHidden.frame.width + 10.0, y: 0.0)
                        }
                        else{
                            self.txtAmount.alpha = 1.0
                            self.txtAmountCents.alpha = 1.0
                            self.btnToggleHidden.alpha = 0.0
                            
                            self.viewContainer.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
                        }
                        
        },
        completion: {success in
            
        })
        
        
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
