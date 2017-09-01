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
	private var mContent : String {
        get {
            return mContent
        }
        set(content) {
            mContent = content
        }
    }
	/** 날짜 */
	private var mDate : String {
        get {
            return mDate
        }
        set(date) {
            mDate = date
        }
    }
	/** 닉네임 */
	private var mNickName : String {
        get {
            return mNickName
        }
        set(nickname) {
            mNickName = nickname
        }
    }
	/** 번호 */
	private var mIdx : Int {
        get {
            return mIdx
        }
        set(idx) {
            mIdx = idx
        }
    }
	/** 버킷No */
	private var mBucketNo : Int {
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

