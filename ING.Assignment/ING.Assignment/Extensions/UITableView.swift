

import UIKit

extension UITableView {

    func deselectAll(){
        if let selection = self.indexPathForSelectedRow
        {
            self.deselectRow(at: selection, animated: false)
        }
    }
    
}
