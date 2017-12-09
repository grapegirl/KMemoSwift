//
//  Bucket.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class Bucket : Object {
    
    /**
     * 카테고리코드
     */
    
    dynamic var mCategoryCode : Int = 0
    /**
     * 메모내용
     */
    dynamic var mContent : String = ""
    /**
     * 날짜
     */
    dynamic var mCompleteYN : String = ""
    

    /**
     * 날짜
     */
    dynamic var mCompleteDate : String = ""
    /**
     * 번호
     */
   
    dynamic var mIdx : Int  = 0
    /**
     * 닉네임
     */
    dynamic var mNickName : String = ""
    /**
     * 사용자 전화번호
     */
    dynamic var mPhone : String = ""
    /**
     * 이미지 저장경로
     */
    dynamic var mImageURl : String = ""
    
    public func toString() -> String{
        var strTemp = ""
        strTemp = "mContents : " + mContent + ",mCompleteDate: " + mCompleteDate
        return strTemp
    }

    override static func primaryKey() -> String? {
        return "mContent"
    }
 
    public func toDictionary() -> [String:String] {
        var map =  [String:String]()
        map["CATEGORY_CODE"] = String(mCategoryCode)
        map["NICKNAME"] = mNickName
        map["PHONE"] = mPhone
        map["CONTENT"] = mContent
        if (mImageURl.count > 0) {
             map["IMAGE_URL"] = "Y"
        } else {
            map["IMAGE_URL"] = "N"
        }
        map["CREATE_DT"] = mCompleteDate
        return map
     }
}

