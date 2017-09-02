//
//  MobileUser.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class MobileUser {
    
   /**
     * 모바일 OS
     */
    private var mOs : String {
        get {
            return mOs
        }
        set(os) {
            mOs = os
        }
    }
    /**
     * 사용자 전화번호
     */
    private var mPhone : String {
        get {
            return mPhone
        }
        set(phone) {
            mPhone = phone
        }
    }
    /**
     * 사용자 닉네임
     */
    private var mUserNickName  : String {
        get {
            return mUserNickName
        }
        set(nickname) {
            mUserNickName = nickname
        }
    }
    /**
     * 사용자 버전명
     */
    private var mVersionName  : String {
        get {
            return mVersionName
        }
        set(version) {
            mVersionName = version
        }
    }
    /**
     * 사용자 마켓구분
     */
    private var mMarket  : String {
        get {
            return mMarket
        }
        set(market) {
            mMarket = market
        }
    }
    /**
     * 사용자 언어
     */
    private var mLanguage  : String {
        get {
            return mLanguage
        }
        set(lang) {
            mLanguage = lang
        }
    }
    /**
     * 사용자 나라
     */
    private var mCountry  : String {
        get {
            return mCountry
        }
        set(county) {
            mCountry = county
        }
    }
    /**
     * 사용자 최근 방문 날짜
     */
    private var mLastDt  : String {
        get {
            return mLastDt
        }
        set(last) {
            mLastDt = last
        }
    }
    /**
     * 사용자 생성 날짜
     */
    private var mCreateDt  : String {
        get {
            return mCreateDt
        }
        set(dt) {
            mCreateDt = dt
        }
    }
    /**
     * 사용자 토큰키
     */
    private var mGcmToken  : String {
        get {
            return mGcmToken
        }
        set(token) {
            mGcmToken = token
        }
    }
    
    var description : String {
        return "Os=\(mOs),UserNickName=\(mUserNickName),VersionName=\(mVersionName),Market=\(mMarket),Language=\(mLanguage),Country=\(mCountry)LastDt=\(mLastDt),CreateDt=\(mCreateDt),GcmToken=\(mGcmToken)";
    }

    /**
     * 생성자
     */
    init() {
        self.mOs = "ANDROID"
        self.mMarket = "GOOGLE"
        self.mGcmToken = "N"
    }
    
    
    /**
     * 소멸자
     */
    deinit {

    }  
    
}

