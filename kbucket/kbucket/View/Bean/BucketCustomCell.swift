
//
//  BucketCustomCell.swift
//  kbucket
//
//  Created by 김미혜 on 2017. 12. 11..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class BucketCustomCell  : UITableViewCell { 
    
    private let TAG : String = "BucketCustomCell"
  
    @IBOutlet weak var mIvImage: UIImageView!
    @IBOutlet weak var mEtContent: UITextField!
    @IBOutlet weak var mbtDate: UIButton!
    public var mData : String = ""
    
    private var mListenr : EventProtocol? = nil
    
    @IBAction func onClick(_ sender: Any)
    {
        switch((sender  as! UITextField))
        {
        case mEtContent:
            mListenr?.receiveEventFromViewItem(gbn: 0, data: mData)
            break;
        default:
            break;
        }
        
    }
    
    
    public func setOnEventListener(listenr : EventProtocol)
    {
        if (listenr != nil){
            mListenr = listenr
        }
    }
}

