//
//  HttpUrlTaskManager.swift
//  kbucket
//
//  Created by 김미혜 on 2017. 11. 4..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import Foundation

class HttpUrlTaskManager {
    
    private let TAG : String = "HttpUrlTaskManager"
    
    /**
     * 접속할 URL
     */
    private var mURl : String
    
    /**
     * post방식 true, get방식-false
     */
    private var isPost  : Bool = false
    
    /**
     * HTTP 리시브 콜백 메소드 객체
     */
    private var mIHttpReceive : IHttpReceive
    /**
     * action Id
     */
    private var mId : Int
    
    /**
     * 생성자
     */
    public init(url : String, post : Bool,  receive : IHttpReceive, id : Int) {
        mURl = url;
        isPost = post;
        mIHttpReceive = receive;
        mId = id;
    }
    
    func actionTask(){
        let url = URL(string: mURl)
        KLog.d(tag: TAG, msg: "@@ url : " + mURl )
        let task = URLSession.shared.dataTask(with: url!, completionHandler : {
            (data : Data?, response : URLResponse?, error : Error?) -> Void in
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                if self.mIHttpReceive != nil {
                    self.mIHttpReceive.onHttpReceive(type: ConstHTTP.HTTP_FAIL, actionId: ConstHTTP.BUCKET_LIST, data: data! )
                }
                return
            }
           
            if self.mIHttpReceive != nil {
                self.mIHttpReceive.onHttpReceive(type: ConstHTTP.HTTP_OK, actionId: ConstHTTP.BUCKET_LIST, data: data! )
            }
        })
        
        task.resume()
    }
}