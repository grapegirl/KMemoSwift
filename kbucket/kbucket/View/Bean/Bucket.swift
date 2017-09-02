//
//  Bucket.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class Bucket  {
    
    /**
     * 카테고리코드
     */
    private var mCategoryCode : Int {
        get {
            return mCategoryCode
        }
        set(CategoryCode) {
            mCategoryCode = CategoryCode
        }
    }

    /**
     * 메모내용
     */
    private var mContent : String {
        get {
            return mContent
        }
        set(content ) {
            mContent = content
        }
    }

    /**
     * 날짜
     */
    private var mCompleteDate : String {
        get {
            return mCompleteDate
        }
        set(date) {
            mCompleteDate = date
        }
    }
    /**
     * 번호
     */
    private var mIdx : Int {
        get {
            return mIdx
        }
        set( idx) {
            mIdx = idx
        }
    }
    /**
     * 닉네임
     */
    private var mNickName : String {
        get {
            return mNickName
        }
        set( NickName) {
            mNickName =  NickName
        }
    }
    /**
     * 사용자 전화번호
     */
    private var mPhone : String {
        get {
            return mPhone
        }
        set(Phone) {
            mPhone = Phone
        }
    }
    /**
     * 이미지 저장경로
     */
    private var mImageURl : String {
        get {
            return mImageURl
        }
        set( imageUrl) {
            mImageURl =  imageUrl
        }
    }

    /**
     * 생성자
     */
    init() {

    }

    /**
     * 소멸자
     */
    deinit {

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

