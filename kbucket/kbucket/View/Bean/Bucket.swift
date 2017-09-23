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
    dynamic var mCompleteDate : String = ""
    /**
     * 번호
     */
    dynamic var mIdx : Int = 0
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

    
    override static func primaryKey() -> String? {
        return "mContent"
    }
    
    public func toString() -> String{
        var strTemp = ""
        strTemp = "mContents : " + mContent + ",mCompleteDate: " + mCompleteDate
        return strTemp
    }

 
//    public HashMap<String, Object> toHasnMap() {
//         HashMap<String, Object> map = new HashMap<String, Object>();
//         map.put("CATEGORY_CODE", mCategoryCode);
//         map.put("NICKNAME", mNickName);
//         map.put("PHONE", mPhone);
//         map.put("CONTENT", mContent);
//         if (mImageURl != null && !mImageURl.equals("")) {
//             map.put("IMAGE_URL", "Y");
//         } else {
//             map.put("IMAGE_URL", "N");
//         }
//         map.put("CREATE_DT", mCompleteDate);
//         return map;
//     }
}

