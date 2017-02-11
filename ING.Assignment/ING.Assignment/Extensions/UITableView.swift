//
//  UITableView.swift
//  Radiodrome
//
//  Created by Max Bondarenko on 1/17/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import UIKit

extension UITableView {

    func deselectAll(){
        if let selection = self.indexPathForSelectedRow
        {
            self.deselectRow(at: selection, animated: false)
        }
    }
    
}
