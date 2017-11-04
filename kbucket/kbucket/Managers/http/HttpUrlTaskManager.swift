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
            (data, response, error) -> Void in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                return
            }
            guard let returnStr = String(data: data!, encoding: .utf8) else {
                return
            }
            
            print(returnStr)
        })
        
        task.resume()
//        try {
//        URL url = new URL(mURl);
//        URLConnection urlConnection = url.openConnection();
//        HttpURLConnection httpURLConnection = (HttpURLConnection) urlConnection;
//        httpURLConnection.setConnectTimeout(5000);
//        httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
//        if (isPost) {
//        try {
//        httpURLConnection.setRequestMethod("POST");
//        } catch (ProtocolException e) {
//        e.printStackTrace();
//        }
//        httpURLConnection.setDoOutput(true);
//        } else {
//        httpURLConnection.setRequestMethod("GET");
//        }
//        httpURLConnection.setDoInput(true);
//        httpURLConnection.setUseCaches(false);
//        httpURLConnection.setDefaultUseCaches(false);
//
//        if (isPost) {//Post 방식으로 데이타 전달시
//        OutputStream outputStream = httpURLConnection.getOutputStream();
//        if (params != null) {
//        String sendData = (String) params[0];
//        //System.out.println("@@ sendData : " + sendData);
//        outputStream.write(sendData.getBytes("UTF-8"));
//        outputStream.flush();
//        outputStream.close();
//        }
//        }
//        if (httpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
//        String buffer = null;
//        BufferedReader bufferedReader;
//        if (isPost) {
//        bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "UTF-8"));
//        } else {
//        bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "UTF-8"));
//        }
//        while ((buffer = bufferedReader.readLine()) != null) {
//        data += buffer;
//        }
//        bufferedReader.close();
//        httpURLConnection.disconnect();
//        mIHttpReceive.onHttpReceive(mIHttpReceive.HTTP_OK, mId,  data);
//        }else{
//        mIHttpReceive.onHttpReceive(mIHttpReceive.HTTP_FAIL, mId, httpURLConnection.getResponseMessage());
//        }
//        } catch (MalformedURLException e) {
//        e.printStackTrace();
//        Log.d(this.getClass().getSimpleName(), " @@ MalformedURLException");
//        mIHttpReceive.onHttpReceive(mIHttpReceive.HTTP_FAIL, mId,  null);
//
//        } catch (ProtocolException e) {
//        e.printStackTrace();
//        Log.d(this.getClass().getSimpleName(), " @@ ProtocolException");
//        mIHttpReceive.onHttpReceive(mIHttpReceive.HTTP_FAIL, mId, null);
//        } catch (UnsupportedEncodingException e) {
//        e.printStackTrace();
//        Log.d(this.getClass().getSimpleName(), " @@ UnsupportedEncodingException");
//        mIHttpReceive.onHttpReceive(mIHttpReceive.HTTP_FAIL, mId, null);
//        } catch (IOException e) {
//        e.printStackTrace();
//        Log.d(this.getClass().getSimpleName(), " @@ IOException");
//        mIHttpReceive.onHttpReceive(mIHttpReceive.HTTP_FAIL, mId, null);
//        }
//        return null;
    }
}
