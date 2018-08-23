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
	dynamic var mContent : String  = ""
	/** 날짜 */
	dynamic var mDate : String = ""
	/** 닉네임 */
	dynamic var mNickName : String = ""
	/** 번호 */
	dynamic var mIdx : Int  = 0
	/** 버킷No */
	dynamic var mBucketNo : Int = 0

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

