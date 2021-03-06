

import UIKit
import Fontello_Swift



extension NSAttributedString {

    
    func appendFontEntypo(icon: Entypo, size: Int, color: UIColor) -> NSMutableAttributedString{
        let iconString = Entypo.stringWithName(icon)
        let attributedString = NSMutableAttributedString(string: iconString)
        
        let attrsFA = [NSFontAttributeName : Entypo.fontOfSize(CGFloat(size)),
                        NSForegroundColorAttributeName: color]
        attributedString.addAttributes(attrsFA, range: NSRange.init(location: 0, length: 1))
        
        let copy = (self.mutableCopy() as! NSMutableAttributedString)
        copy.append(attributedString)
        
        return copy
    }
    

    
    func appendIngMe(text: String, size: Int, color: UIColor) -> NSMutableAttributedString{
        
        let attributedString = NSMutableAttributedString(string: text)
        
        let attrs = [NSFontAttributeName : UIFont.fontIngRegular(size: size),
                      NSForegroundColorAttributeName: color]
        
        attributedString.addAttributes(attrs, range: NSRange.init(location: 0, length: text.characters.count - 0))
        
        let copy = (self.mutableCopy() as! NSMutableAttributedString)
        copy.append(attributedString)
        
        return copy
    }
    
}
