

import UIKit
import Fontello_Swift



extension UIImage {
    class func imageWithLabel(label: UILabel) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0.0)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    class func fontModernPictogrammsImage(/*width: Int, height: Int, */icon: ModernPictograms, fontSize: Int, color: UIColor) -> UIImage{
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        label.attributedText = String.fontModernPictogramsAttributedString(text: "", icon: icon, size: fontSize)
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.textColor = color
        let image = UIImage.imageWithLabel(label: label).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        return image
    }
    

    static func fromColor(color: UIColor) -> UIImage {
            let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()
            context!.setFillColor(color.cgColor)
            context!.fill(rect)
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return img!
    }
    

    
    class func fontEntypoImage(icon: Entypo, fontSize: Int, color: UIColor) -> UIImage{
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        label.attributedText = String.fontEntypoAttributedString(text: "", icon: icon, size: fontSize)
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.textColor = color
        let image = UIImage.imageWithLabel(label: label).withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        return image
    }
}
