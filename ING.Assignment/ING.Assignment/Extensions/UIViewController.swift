

import UIKit

extension UIViewController {

    class func rootNavigationController() -> UINavigationController?{
        let rootVC = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController
        return rootVC
    }

    class func setRootNavigationController(vc: UIViewController){
        UIApplication.shared.windows[0].rootViewController = vc
    }
    
}
extension UIApplication {
    
    class func rootNavigationController() -> UINavigationController?{
        let rootVC = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController
        return rootVC
    }
    
    class func setRootNavigationController(vc: UIViewController){
        UIApplication.shared.windows[0].rootViewController = vc
    }
    
}
