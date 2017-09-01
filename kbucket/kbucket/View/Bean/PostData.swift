//
//  PostData.swift
//  
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation
import UIKit

class PostData  {
    
   /**
     * 타이틀
     */
    private var m_title : String { 
        get {
            return m_title
        }
        set(title) {
            m_title = title
        }
    }

    /**
     * 등록 날짜
     */
    private var m_date : String { 
        get {
            return m_date
        }
        set(date) {
            m_date = date
        }        
    }
    /**
     * 내용
     */
    private var m_contents : String { 
        get {
            return m_contents
        }
        set(content) {
            m_contents = content
        }
    }

    /**
     * 순번
     */
    private var mNo : Int {
        get {
            return mNo
        }
        set(no) {
            mNo = no
        }
    }

    /**
     * 이미지 이름
     */
    private var mImageName : String { 
      get {
            return mImageName
        }
        set(imgName) {
            mImageName = imgName
        }
    }

    /**
     * 완료여부
     */
    private var mCompleteYN : String { 
        get {
            return mCompleteYN
        }
        set(completeYn) {
            mCompleteYN = completeYn
        }
    }

    /**
     * 기한
     */
    private var mDeadline : String { 
        get {
            return mDeadline
        }
        set(deadline) {
            mDeadline = deadline
        }
    }

    
    /**
     * 생성자
     */
    init() {
        self.m_contents = ""
    }

    /**
     * 생성자
     */
    init(String contents) {
        self.m_title = nil
        self.m_date = nil
        self.m_contents = contents
        self.mNo = 0
    }

    init(String contents, String date) {
        self.m_title = nil
        self.m_date = date
        self.m_contents = contents
        self.mNo = 0
    }

    /**
     * 생성자
     */
    init(String title, String contents, String date, int no) {
        self.m_title = title
        self.m_date = date
        self.m_contents = contents
        self.mNo = = no
    }

    /**
     * 소멸자
     */
    deinit {

    }

    var description : String {
        return "contents=\(m_contents),date=\(m_date),complete_yn=\(mCompleteYN),image_path=\(mImageName)"
    }
}

