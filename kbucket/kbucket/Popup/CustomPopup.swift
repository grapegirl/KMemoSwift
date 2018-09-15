//
//  CustomPopup.swift
//  kbucket
//
//  Created by 김미혜 on 2018. 9. 4..
//  Copyright © 2018년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class CustomPopup {
    
    static var backView : UIView!
    static var centerView : UILabel!
    static var exitButton : UIButton!
    
    init() {
    }
    
   public static func showDialog(message : String) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
        CustomPopup.backView = UIView(frame: CGRect(x: 0, y: 0, width: appDelegate.window!.frame.size.width, height: appDelegate.window!.frame.size.height))
        CustomPopup.backView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        CustomPopup.backView.isUserInteractionEnabled = true

        appDelegate.window!.addSubview(CustomPopup.backView)
    
        CustomPopup.centerView = UILabel(frame: CGRect(x: appDelegate.window!.frame.size.width/4, y: appDelegate.window!.frame.size.height/2, width: appDelegate.window!.frame.size.width/2, height: 100))
        CustomPopup.centerView.backgroundColor = UIColor.red
        CustomPopup.centerView.textColor = UIColor.white
        CustomPopup.centerView.textAlignment = .center
        CustomPopup.centerView.text = message
        CustomPopup.centerView.numberOfLines = 5
        CustomPopup.centerView.font = UIFont(name: "Montserrat-Light", size: 15.0)
        CustomPopup.centerView.alpha = 1.0
        CustomPopup.centerView.layer.cornerRadius = 10;
        CustomPopup.centerView.clipsToBounds  =  true
    
        appDelegate.window!.addSubview(CustomPopup.centerView)
    
        CustomPopup.exitButton = UIButton(frame: CGRect(x: 0, y: 0, width : 100, height : 50))
        CustomPopup.exitButton.setTitle("exit", for: .normal)
        CustomPopup.exitButton.backgroundColor = UIColor.gray
        CustomPopup.exitButton.addTarget(self, action: #selector(CustomPopup.click(_:)), for: .touchUpInside)
    
        appDelegate.window!.addSubview(CustomPopup.exitButton)
    
    
    }
    
     @objc public static func click(_ sender: UIButton!) {
        CustomPopup.backView.removeFromSuperview()
        CustomPopup.centerView.removeFromSuperview()
        CustomPopup.exitButton.removeFromSuperview()
    }
    
}
