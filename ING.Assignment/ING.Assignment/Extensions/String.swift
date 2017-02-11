
import UIKit
import Security
import Fontello_Swift

extension String {
    func substring(toIndex: Int) -> String{
        let index = self.index(self.startIndex, offsetBy: toIndex)
        return self.substring(to: index)
    }
    
    func urlEncode()->String{
        return (self ).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }

    
    func calculateNumberOfLines(width: CGFloat, font: UIFont) -> Int
    {
        let attributes = [NSFontAttributeName: font]
        
        
        let nsStr = self as NSString
        
        let lineSize = nsStr.size(attributes: attributes)
        
        let allWidth = lineSize.width
        
        let numberOfLines = ceil( allWidth / width )
        //var totalHeight = numberOfLines * lineSize.height
        
        return Int(numberOfLines + 1)
    }
    
    func numberWithUniversalDecSep() -> NSNumber?
    {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal;
        formatter.decimalSeparator = "."
        if let number = formatter.number(from: self.replacingOccurrences(of: ",", with: ".")) {
            print(number)
            return number
        }
        else{
            return nil
        }
    }
    

    
    static func fontEntypoAttributedString(text:String, icon: Entypo, size: Int)->NSAttributedString{
        
        let symbol = Entypo.stringWithName(icon)
        let textString = text
        let attributedString = NSMutableAttributedString(string: symbol + textString)
        
        let attrs = [NSFontAttributeName : UIFont(name: "HelveticaNeue", size: CGFloat(size))
        ]
        
        let attrsFA = [NSFontAttributeName : Entypo.fontOfSize(CGFloat(size))
        ]
        attributedString.addAttributes(attrsFA, range: NSRange.init(location: 0, length: 1))
        attributedString.addAttributes(attrs, range: NSRange.init(location: 1, length: textString.characters.count))
        return attributedString
      
    }

    static func fontModernPictogramsAttributedString(text:String, icon: ModernPictograms, size: Int)->NSAttributedString{
        
       
        let symbol = ModernPictograms.stringWithName(icon)
        let textString = text
        let attributedString = NSMutableAttributedString(string: symbol + textString)
        
        let attrs = [NSFontAttributeName : UIFont(name: "HelveticaNeue", size: CGFloat(size))
        ]
        
        let attrsFA = [NSFontAttributeName : ModernPictograms.fontOfSize(CGFloat(size))]
        attributedString.addAttributes(attrsFA, range: NSRange.init(location: 0, length: 1))
        attributedString.addAttributes(attrs, range: NSRange.init(location: 1, length: textString.characters.count))
        return attributedString
        
    }
    
    private func hexStringFromData(input: NSData) -> String {
        let sha256description = input.description as String
        
        // TODO: more elegant way to convert NSData to a hex string
        
        var result: String = ""
        
        for char in sha256description.characters {
            switch char {
            case "0", "1", "2", "3", "4", "5", "6", "7","8","9", "a", "b", "c", "d", "e", "f":
                result.append(char)
            default:
                result += ""
            }
        }
        
        return result
    }
    
    func dataUtf8() -> NSData{
        return self.data(using: String.Encoding.utf8)! as NSData
    }
    
}
