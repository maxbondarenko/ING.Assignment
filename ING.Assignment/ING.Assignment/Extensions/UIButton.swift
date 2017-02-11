//
//  UIButton.swift
//  Radiodrome
//
//  Created by Max Bondarenko on 11/5/16.
//  Copyright © 2016 MBKO. All rights reserved.
//

import UIKit
import Fontello_Swift


extension UIButton {

    func makeRoundCorners(color: UIColor, bgColor: UIColor, borderColor: UIColor, borderWidth: CGFloat){
        
        DispatchQueue.main.async(execute: {
            self.layer.cornerRadius = self.frame.size.height / 2
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
            
            self.setTitleColor(color, for: UIControlState.normal)
            self.backgroundColor = bgColor
            
        })
    }
    
    func makeBackButton(){
        self.makeTitleWithEntypoIcon(icon: Entypo.LeftOpenBig, text: "", fontSize: 20)
    
    }
    

    func makeTitleWithEntypoIcon(icon: Entypo, text:String, fontSize: Int){
        let str = String.fontEntypoAttributedString(text: text, icon: icon, size: fontSize)
        
        self.setAttributedTitle(str, for: UIControlState.normal)
        self.tintColor = UIColor.black
        
    }
    
   
    
    func setButtonStateDefault(title: String){
        self.setAttributedTitle(nil, for: UIControlState.normal)
        self.setTitle(title, for: UIControlState.normal)
        
        for subview in self.subviews{
            if(subview is UIActivityIndicatorView){
                subview.removeFromSuperview()
            }
        }
        
        self.alpha = 0.40
        self.makeRoundCorners(color: UIColor.white, bgColor: UIColor.black, borderColor: UIColor.clear ,borderWidth: 1)
        
    }
    
    func setButtonStateActive(){
        //self.setAttributedTitle(nil, for: UIControlState.normal)
        
        for subview in self.subviews{
            if(subview is UIActivityIndicatorView){
                subview.removeFromSuperview()
            }
        }
        
        self.alpha = 1
        //self.makeRoundCorners(color: UIColor.white, bgColor: UIColor.black, borderColor: UIColor.clear ,borderWidth: 1)
        
    }
    
    func setButtonStateActive(title: String){
        
        self.setTitle(title, for: UIControlState.normal)
        self.setButtonStateActive()
        
    }
    
    
    
    func setButtonStateInProgress(spinnerScale: CGFloat, x : CGFloat, y: CGFloat){
        //self.setTitle("", for: UIControlState.normal)
        
       // let width = self.frame.width as CGFloat
       // let height = self.frame.height as CGFloat
        
        
        let spinner = UIActivityIndicatorView(frame: CGRect(x: x, y: y, width: 20, height: 20))
        
        spinner.transform = CGAffineTransform(scaleX: spinnerScale, y: spinnerScale)

        //spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        spinner.isHidden = false
        spinner.startAnimating()
        spinner.color = self.titleColor(for: UIControlState.normal)
        self.addSubview(spinner)
        
        self.alpha = 1
        //self.makeRoundCorners(color: UIColor.white, bgColor: UIColor.black, borderColor: UIColor.clear ,borderWidth: 1)
        
    }
    func setButtonStateInProgress(){
        //self.setTitle("", for: UIControlState.normal)

        let width = self.frame.width as CGFloat
        let height = self.frame.height as CGFloat
        
        let spinnerSize = 20.0  as CGFloat
        
        
        
        let spinner = UIActivityIndicatorView(frame: CGRect(x: /*(width/2.0)*/ 0 + (spinnerSize), y: (height / 2.0) - (spinnerSize / 2.0), width: spinnerSize, height: spinnerSize))
        
        
        //spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        spinner.isHidden = false
        spinner.startAnimating()
        spinner.color = self.titleColor(for: UIControlState.normal)
        self.addSubview(spinner)
        
        self.alpha = 1
        //self.makeRoundCorners(color: UIColor.white, bgColor: UIColor.black, borderColor: UIColor.clear ,borderWidth: 1)
        
    }
    
    
}
