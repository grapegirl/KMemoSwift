//
//  UpdateApp.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class UpdateApp {
    
	/** 타이틀 */
	var mVersionCode : Int {
		get {
            return mVersionCode
        }
        set(versionCode) {
            mVersionCode = versionCode
        }
	}
	/** 내용 */
	var mContent : String {
		get {
            return mContent
        }
        set(content) {
            mContent = content
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

