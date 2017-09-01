//
//  Category.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class Category  {
    
   /** 카테고리 코드 */
	private var mCategoryCode : Int {
        get {
            return mCategoryCode
        }
        set(categoryCode) {
            mCategoryCode = categoryCode
        }
    }
	/** 카테고리명 */
	private var mCategoryName : String {
        get {
            return mCategoryName
        }
        set(categoryName) {
            mCategoryName = categoryName
        }
    }

	public Category(String name, int code) {
		mCategoryName= name;
		mCategoryCode = code;
	}


    /**
     * 생성자
     */
    init() {

    }

    init(name : String, code : Int){
        self.mCategoryName = name
		self.mCategoryCode = code
    }

    /**
     * 소멸자
     */
    deinit {

    }  
    
    
}

