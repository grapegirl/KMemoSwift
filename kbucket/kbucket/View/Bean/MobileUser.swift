//
//  MobileUser.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class MobileUser : UITableViewCell {
    
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

    /**
     * 생성자
     */
    init() {
        self.mOs = "ANDROID";
        self.mMarket="GOOGLE";
        self.mGcmToken="N";
    }

    /**
     * 소멸자
     */
    deinit {

    }  
    

   

    // @Override
    // public String toString() {
    //     StringBuilder sb = new StringBuilder();
    //     sb.append("Os=");
    //     sb.append(mOs);
    //     sb.append(",");
    //     sb.append("UserNickName=");
    //     sb.append(mUserNickName);
    //     sb.append(",");
    //     sb.append("VersionName=");
    //     sb.append(mVersionName);
    //     sb.append(",");
    //     sb.append("Market=");
    //     sb.append(mMarket);
    //     sb.append(",");
    //     sb.append("Language=");
    //     sb.append(mLanguage);
    //     sb.append(",");
    //     sb.append("Country=");
    //     sb.append(mCountry);
    //     sb.append(",");
    //     sb.append("LastDt=");
    //     sb.append(mLastDt);
    //     sb.append(",");
    //     sb.append("CreateDt=");
    //     sb.append(mCreateDt);
    //     sb.append(",");
    //     sb.append("GcmToken=");
    //     sb.append(mGcmToken);
    //     return sb.toString();
    // }

    
}

