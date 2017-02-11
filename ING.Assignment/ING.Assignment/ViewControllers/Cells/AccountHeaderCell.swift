//
//  AccountHeaderCell.swift
//  ING.Assignment
//
//  Created by Max Bondarenko on 2/11/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import UIKit

class AccountHeaderCell: UITableViewCell {

    
    @IBOutlet weak var txtAccountGroupType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func getHeight()->CGFloat{
        return CGFloat(37)
    }
    
    func populateCell(title: String){
        txtAccountGroupType.text = title
        

    }

}
