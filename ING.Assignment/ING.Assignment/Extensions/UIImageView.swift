
import UIKit
import Alamofire
import Fontello_Swift

extension UIImageView {
   
}


public class ImageCache: NSObject {
    
    public class var sharedInstance: ImageCache {
        struct Singleton {
            static let instance = ImageCache()
        }
        return Singleton.instance
    }
    
    
    var cache : [String : UIImage?] = ["" : nil]
    
    
    public func setImage(image : UIImage, urlString: String)
    {
        cache[urlString] = image
    }
    
    public func getImage(urlString: String) -> UIImage?{
        let res = cache[urlString] ?? nil
        
        return res
        
    }
    
    public func clearCache(){
        cache.removeAll(keepingCapacity: false)
    }
    
}
