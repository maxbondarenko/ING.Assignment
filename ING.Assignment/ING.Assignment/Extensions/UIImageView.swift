//
//  UIImageView.swift
//  Radiodrome
//
//  Created by Max Bondarenko on 12/12/16.
//  Copyright © 2016 MBKO. All rights reserved.
//

import UIKit
import Alamofire
import Fontello_Swift

extension UIImageView {
    func downloadImage(url : String) -> Void{
        
        let cachedImage = ImageCache.sharedInstance.getImage(urlString: url)
        if(cachedImage != nil){
            self.image = cachedImage
            return
        }
        
        Alamofire.request(url).responseImage { (response) in
            if(response.result.isSuccess)
            {
                ImageCache.sharedInstance.setImage(image: response.result.value!, urlString: url)
                self.image = response.result.value!
                self.alpha = 0
                self.fadeIn()
            }
            else{
                self.image = nil
                //toImageView.backgroundColor = UIColor.extraLightGray2()
            }
            
        }
    }
    
    func downloadImage(url : String, iconOnFail: Entypo) -> Void{
        
        let cachedImage = ImageCache.sharedInstance.getImage(urlString: url)
        if(cachedImage != nil){
            self.image = cachedImage
            return
        }
        
        Alamofire.request(url).responseImage { (response) in
            
            if(response.result.isSuccess)
            {
                self.makeBorder(color: UIColor.black, borderWidth: 1.0)
                ImageCache.sharedInstance.setImage(image: response.result.value!, urlString: url)
                self.image = response.result.value!
                self.alpha = 0
                self.fadeIn()
            }
            else{
                self.image = UIImage.fontEntypoImage(icon: iconOnFail, fontSize: 20, color: UIColor.lightGray)
            }
            
        }
    }
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
