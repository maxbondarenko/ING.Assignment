//
//  AccountCell.swift
//  ING.Assignment
//
//  Created by Max Bondarenko on 2/11/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {

    var account: AccountDTO?
    
    @IBOutlet weak var txtAccountName: UILabel!
    
    
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
        
       self.txtAccountName.text = account.name ?? "n/a"
        
        
        
        
    }

}
