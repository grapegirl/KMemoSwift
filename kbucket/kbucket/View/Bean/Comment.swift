//
//  Comment.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class Comment {
    
    /** 메모내용 */
	var mContent : String {
        get {
            return mContent
        }
        set(content) {
            mContent = content
        }
    }
	/** 날짜 */
	var mDate : String {
        get {
            return mDate
        }
        set(date) {
            mDate = date
        }
    }
	/** 닉네임 */
	var mNickName : String {
        get {
            return mNickName
        }
        set(nickname) {
            mNickName = nickname
        }
    }
	/** 번호 */
	var mIdx : Int {
        get {
            return mIdx
        }
        set(idx) {
            mIdx = idx
        }
    }
	/** 버킷No */
	var mBucketNo : Int {
        get {
            return mBucketNo
        }
        set(bucketNo) {
            mBucketNo = bucketNo
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
    
}

