


import UIKit
import Fontello_Swift

extension UIView {
    func fadeIn(){
        self.isHidden = false
        
        UIView.animate(withDuration: 0.35, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
                self.alpha = 1.0
                
        },
                                   completion: { finished in
        }
        )
    }
    
    func makeRoundCorners(color: UIColor, cornerRadius: CGFloat, borderWidth: CGFloat){
        
        DispatchQueue.main.async(execute: {
            self.layer.cornerRadius = cornerRadius
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = color.cgColor
            
        })
        
    }
    func makeTopBorder(color: UIColor)
    {
        makeTopBorder(color: color, borderWidth: 1)
    }
    
    func makeTopBorder(color: UIColor, borderWidth: Int)
    {
        DispatchQueue.main.async(execute: {
            let bottomView = UIView(frame: CGRect(x: 0, y: 0, width: Int(self.frame.width), height: borderWidth))
            bottomView.backgroundColor = color
            
            let oldTopView = self.viewWithTag(666999)
            if(oldTopView != nil){
                oldTopView?.removeFromSuperview()
                oldTopView?.isHidden = true
            }
            let oldBottomView = self.viewWithTag(999666)
            if(oldBottomView != nil){
                oldBottomView?.removeFromSuperview()
                oldBottomView?.isHidden = true
            }
            
            
            
            bottomView.tag = 666999
            self.addSubview(bottomView)
        })
    }
    

    

    
    func addIconOverlayInTheCenter(icon: Entypo, color: UIColor, bgColor: UIColor, borderColor: UIColor, animated: Bool){
        let imgCheck = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        
        imgCheck.image = UIImage.fontEntypoImage(icon: icon, fontSize: 20, color: color)
        
        imgCheck.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        imgCheck.alpha  = 0
        imgCheck.tag = 667
        imgCheck.backgroundColor = bgColor
        
        
        self.addSubview(imgCheck)
        
        let dura = animated ? 0.3 : 0.0
        
        UIView.animate(withDuration: dura, animations: {
            imgCheck.transform = CGAffineTransform(scaleX: 1, y: 1)
            imgCheck.alpha  = 1
            imgCheck.makeRoundCorners()
            
        }, completion: {
            (value: Bool) in
            
            self.makeRoundCorners(color: borderColor, borderWidth: 1)
        })
        
        
    }
    func removeOverlays(){
        for sub in self.subviews{
            if(sub is UIActivityIndicatorView && sub.tag == 667){
                sub.removeFromSuperview()
            }
        }
    }
    
    func addSpinnerInTheCenter(color: UIColor){
        
        let spinner = UIActivityIndicatorView(frame: CGRect(x: self.frame.width / 2.0 - 10, y: self.frame.height / 2.0 - 10, width: 20, height: 20))
        
        spinner.color = color
        spinner.hidesWhenStopped = false
        spinner.isHidden = false
        spinner.startAnimating()
        spinner.tag = 666
        self.addSubview(spinner)
    }
    
    func removeSpinnerFromCenter(){
        for sub in self.subviews{
            if(sub is UIActivityIndicatorView && sub.tag == 666){
                sub.removeFromSuperview()
            }
        }
    }
    
    func clearBorders(){
        DispatchQueue.main.async(execute: {
            
            let oldTopView = self.viewWithTag(666999)
            if(oldTopView != nil){
                oldTopView?.removeFromSuperview()
                oldTopView?.isHidden = true
            }
          
            let oldBottomView = self.viewWithTag(999666)
            if(oldBottomView != nil){
                oldBottomView?.removeFromSuperview()
                oldBottomView?.isHidden = true
            }
            
          
        })
    }
    func makeBottomBorder(color: UIColor)
    {
        DispatchQueue.main.async(execute: {
            let bottomView = UIView(frame: CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1))
            
            let oldTopView = self.viewWithTag(666999)
            if(oldTopView != nil){
                oldTopView?.removeFromSuperview()
                oldTopView?.isHidden = true
            }
            let oldBottomView = self.viewWithTag(999666)
            if(oldBottomView != nil){
                oldBottomView?.removeFromSuperview()
                oldBottomView?.isHidden = true
            }
            
            bottomView.backgroundColor = color
            bottomView.tag = 999666
            self.addSubview(bottomView)
        })
    }
    
    func makeBorder(color: UIColor, borderWidth: CGFloat){
        
        DispatchQueue.main.async(execute: {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = color.cgColor
        })
        
    }
    
    func makeRoundCorners(color: UIColor, borderWidth: CGFloat){
        
        DispatchQueue.main.async(execute: {
            self.layer.cornerRadius = self.frame.size.height / 2
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = color.cgColor
            
        })
        
    }
    
    func fadeIn(duration:Double, delay:Double){
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
                self.alpha = 1.0
                
        },
                                   completion: { finished in
        }
        )
    }
    
    func fadeOut(duration:Double, delay:Double){
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
                self.alpha = 0
        },
                                   completion: { finished in
        }
        )
    }
    
    func fadeOut(){
        UIView.animate(withDuration: 0.35, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
                self.alpha = 0
        },
                                   completion: { finished in
        }
        )
    }
    
    func makeRoundCorners(radius: CGFloat){
        DispatchQueue.main.async(execute: {
            self.layer.cornerRadius = radius
        })
    }
    
    func makeGradientBackground(colorTop:CGColor!, colorBottom: CGColor!){
        let view = self
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.locations = [0.0,  1.0]
        gradient.colors = [colorTop, colorBottom]
        view.layer.mask = gradient
    }
    
    func makeRoundCorners(){
        DispatchQueue.main.async(execute: {
            self.layer.cornerRadius = self.frame.height / 2.0
        })
    }
    
    func modifyConstraint(attributes: [NSLayoutAttribute], modification: (NSLayoutConstraint)->()) {
        
        if let constraints = constraints as? [NSLayoutConstraint] {
            for c in constraints.filter({
                return attributes.index(of: $0.firstAttribute) != nil
            }) {
                modification(c)
            }
        }
        
    }
}
