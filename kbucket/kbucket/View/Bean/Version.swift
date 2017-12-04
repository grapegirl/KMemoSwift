//
//  Version.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class Version {
    
  	/** 버전 코드 */
	var mVersionCode : Int {
		get {
            return mVersionCode
        }
        set(versionCode) {
            mVersionCode = versionCode
        }
	}

	/** 버전명 */
	var mVersionName : String {
  		get {
            return mVersionName
        }
        set(versionName) {
            mVersionName = versionName
        }
	}

	/** 강제업데이트 여부 */
	var mForceYN : String {
		get {
            return mForceYN
        }
        set(force) {
            mForceYN = force
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

