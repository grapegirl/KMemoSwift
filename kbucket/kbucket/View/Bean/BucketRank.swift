//
//  BucketRank.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class BucketRank {
    
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
     * 카테고리명
     */
    private var mCategoryName : String {
        get {
            return mCategoryName
        }
        set(CategoryName) {
            mCategoryName = CategoryName
        }
    }
    /**
     * 메모내용
     */
    private var mContent : String {
        get {
            return mContent
        }
        set(content) {
            mContent = content
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
            mIdx =  idx
        }
    }
    /**
     * 최고에요 카운트
     */
    private var mBestCnt : Int {
        get {
            return mBestCnt
        }
        set(cnt) {
            mBestCnt = cnt
        }
    }
    /**
     * 좋아요 카운트
     */
    private var mGoodCnt : Int {
        get {
            return mGoodCnt
        }
        set(cnt) {
            mGoodCnt = cnt
        }
    }
    /**
     * 괜찮아요 카운트
     */
    private var mSoSoCnt : Int {
        get {
            return mSoSoCnt
        }
        set(cnt) {
            mSoSoCnt = cnt
        }
    }
    /**
     * 사용자 카운트
     */
    private var mComment : Int {
        get {
            return mComment
        }
        set(cnt) {
            mComment = cnt
        }
    }

     /**
     * 생성자
     */
    init() {
        self.mBestCnt = 0;
        self.mGoodCnt = 0;
        self.mSoSoCnt = 0;
        self.mComment = 0;
    }

     /**
     * 소멸자
     */
    deinit {

    }  
    
}

