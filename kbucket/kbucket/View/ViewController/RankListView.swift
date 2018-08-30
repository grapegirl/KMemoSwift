//
//  RankListView.swift
//  버킷 랭킹 목록
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class RankListView : UIViewController , IHttpReceive {

    private let TAG : String = "RankListView"

    private let TOAST_MASSEGE : Int         = 10
    private let SERVER_LOADING_FAIL : Int   = 20
    private let LOAD_BUCKET_RANK : Int      = 30
    private let SET_LIST : Int              = 40
    private let SEND_BUCKET_RANK : Int      = 50
    private let CHECK_NETWORK : Int         = 70

    private var mBucketDataList = Array<BucketRank>()
    private var mBucketRankComment : Int = -1
    private var mBucketRankIdx : Int = -1

    // private RankListAdpater mListAdapter = null;
    // private ListView mListView = null;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: TAG, msg: "viewDidLoad")
        initialize()
    }

    func initialize(){
    //     mHandler.sendEmptyMessage(CHECK_NETWORK);
        AppUtils.sendTrackerScreen(screen : "버킷랭킹화면");
    }
    
    func onHttpReceive(type: Int, actionId: Int, data: Data) {
        KLog.d(tag : TAG, msg : "@@ onHttpReceive actionId: " + String(actionId))
        KLog.d(tag : TAG, msg : "@@ onHttpReceive  type: " + String(type))

        var isValid : Bool  = false
        do {
            if let jsonString = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                if jsonString != nil {
                    isValid = jsonString["isValid"] as! Bool
                    // print(jsonString)
                }
            }
        } catch {
            print("JSON 파상 에러")
        }

        if (actionId == ConstHTTP.RANK_LIST) {
        // KProgressDialog.setDataLoadingDialog(this, false, null, false);
                if (type == ConstHTTP.HTTP_OK && isValid == true) {
                      do {
                        if let jsonString = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                let List : NSArray = jsonString["bucketList"] as! NSArray
                                let size : Int = List.count
                                if size > 0 {
                                mBucketDataList.removeAll()
                                for index in 0...size-1  {
                                    let aObject = List[index] as! [String : AnyObject]
                                    let bucket : BucketRank = BucketRank()
                                    bucket.mCategoryCode = aObject["categoryCode"] as! Int
                                    bucket.mContent = aObject["content"] as! String
                                    bucket.mIdx = aObject["idx"] as! Int
                                    bucket.mBestCnt = aObject["bestCnt"] as! Int
                                    bucket.mGoodCnt = aObject["goodCnt"] as! Int
                                    bucket.mSoSoCnt = aObject["ssoCnt"] as! Int
                                    bucket.mComment = aObject["comment"] as! Int

                                    mBucketDataList.append(bucket)
                                }
                            }
                        }
                        handleMessage(what: SET_LIST, obj: "")
                    } catch {
                        KLog.d(tag : TAG, msg : "@@ Exception : ")
                        handleMessage(what: SERVER_LOADING_FAIL, obj: "")
                    }
                } else {
                    handleMessage(what: SERVER_LOADING_FAIL, obj: "")
                }
        }else if (actionId == ConstHTTP.RANK_UPDATE_COMMENT) {
            //KProgressDialog.setDataLoadingDialog(this, false, null, false);
            if (type == ConstHTTP.HTTP_OK && isValid == true) {
                mBucketDataList.removeAll()
                handleMessage(what: LOAD_BUCKET_RANK, obj: "")
            } else {
                handleMessage(what: SERVER_LOADING_FAIL, obj: "")
            }
        }
    }
  
     func handleMessage(what : Int, obj : String) {
//            switch (what) {
//             case TOAST_MASSEGE:
//                Toast.showToast(message: obj)
//                break;
//            case SERVER_LOADING_FAIL:
//                var message = AppUtils.localizedString(forKey : "server_fail_string")
//                handleMessage(what: TOAST_MASSEGE, obj: message)
//                finish()
//                break;
//            case LOAD_BUCKET_RANK:
//    //             KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);
//    //             String userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
//    //             HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_RANK_LIST_URL, true, this, IHttpReceive.RANK_LIST);
//    //             HashMap<String, Object> map = new HashMap<String, Object>();
//    //             map.put("pageNm", "1");
//    //             map.put("nickname", userNickName);
//    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
//                break;
//            case SET_LIST:
//    //             mListView = (ListView) findViewById(R.id.rank_list_listview);
//    //             mListAdapter = new RankListAdpater(this, R.layout.rank_list_line, mBucketDataList, this);
//    //             mListView.setAdapter(mListAdapter);
//                break;
//            case SEND_BUCKET_RANK:
//    //             KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);
//    //             userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
//    //             httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_RANK_COMMENT, true, this, IHttpReceive.RANK_UPDATE_COMMENT);
//    //             map = new HashMap<String, Object>();
//    //             map.put("idx", mBucketRankIdx);
//    //             map.put("comment", mBucketRankComment);
//    //             map.put("nickname", userNickName);
//    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
//                break;
//            case CHECK_NETWORK:
//    //             boolean isConnect = NetworkUtils.isConnectivityStatus(this);
//    //             if(!isConnect){
//    //                 String connectMsg = getString(R.string.check_network);
//    //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, connectMsg));
//    //             }else{
//    //                 mHandler.sendEmptyMessage(LOAD_BUCKET_RANK);
//    //             }
//                break;
//        }
     }
  
     @IBAction func onClick(_ sender: Any) {
    //     switch (v.getId()) {
    //         //최고에요
    //         case R.id.rank_btn1:
    //             mBucketRankComment = 3;
    //             break;
    //         //좋아요
    //         case R.id.rank_btn2:
    //             mBucketRankComment = 2;
    //             break;
    //         //괜찮네요
    //         case R.id.rank_btn3:
    //             mBucketRankComment = 1;
    //             break;
        // }

    //     Integer nIndex = (Integer) v.getTag();
    //     boolean isSendServer = getCommentCount(nIndex);
    //     // 의견이 없으면 서버에 반영
    //     if (!isSendServer) {
    //         mHandler.sendEmptyMessage(SEND_BUCKET_RANK);
    //         mBucketRankIdx = nIndex;
    //     } else {
    //         mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, "이미 의견을 반영했습니다! "));
    //     }
    }

    private func getCommentCount( index : Int ) -> Bool {
    //     if (mBucketDataList != null) {
    //         for (int i = 0; i < mBucketDataList.size(); i++) {
    //             if (mBucketDataList.get(i).getIdx() == index) {
    //                 int comment = mBucketDataList.get(i).getUserComment();
    //                 if (comment != 0) {
    //                     return true;
    //                 }
    //             }
    //         }
    //     }
        return false
    }

    private func finish(){
        KLog.d(tag: TAG, msg: "finish")
        ViewUtils.changeView(strView: ContextUtils.MAIN_VIEW, viewCtrl: self)
    }
}
