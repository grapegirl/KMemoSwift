//
//  Chat.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class Chat  {
    
   /** 내용 */
	private var mContent :  String {
        get {
            return mContent
        }
        set(content) {
            mContent = content
        }
    }
	/** 날짜 */
	private var mDate :  String {
        get {
            return mDate
        }
        set(date) {
            mDate = date
        }
    }
	/** 방번호 */
	private var mIdx :  String {
        get {
            return mIdx
        }
        set( idx) {
            mIdx =  idx
        }
    }
	/** 닉네임 */
	private var mNickName :  String {
        get {
            return mNickName
        }
        set( NickName) {
            mNickName =  NickName
        }
    }
	/** 사용자 전화번호 */
	private var mPhone :  String {
        get {
            return mPhone
        }
        set(Phone) {
            mPhone = Phone
        }
    }
	/** 이미지 저장경로 */
	private var mImageURl :  String {
        get {
            return mImageURl
        }
        set(imageUrl) {
            mImageURl = imageUrl
        }
    }
	/** 숨긴 여부 */
	private var mIsHidden :  String {
        get {
            return mIsHidden
        }
        set(hidden) {
            mIsHidden = hidden
        }
    }
	/** seq */
	private var mSeq : Int {
        get {
            return mSeq
        }
        set(seq) {
            mSeq = seq
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

