//
//  ShareListViewCtlr.swift
//  공유 목록
//
//  Created by grapegirl on 2017. 11. 04..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class ShareListViewCtlr: UIViewController , IHttpReceive{
    
    private let TAG : String = "ShareListViewCtlr"
    
    private let TOAST_MASSEGE : Int             = 10
    private let CATEGORY_LIST : Int             = 20
    private let SET_CATEGORY : Int              = 30
    private let SERVER_LOADING_FAIL : Int       = 40
    private let SHARE_BUCKET_LIST : Int         = 50
    private let SET_BUCKETLIST : Int            = 60
    private let CHECK_NETWORK : Int             = 70
    
    private var mCategoryList = Array<Category>()
    private var mBucketDataList = Array<Bucket>()
    private var mButtonList = Array<UIButton>()
    
    @IBOutlet weak var btCategory0: UIButton!
    @IBOutlet weak var btCategory1: UIButton!
    @IBOutlet weak var btCategory2: UIButton!
    @IBOutlet weak var btCategory3: UIButton!
    @IBOutlet weak var btCategory4: UIButton!
    @IBOutlet weak var btCategory5: UIButton!
    @IBOutlet weak var btCategory6: UIButton!
    @IBOutlet weak var btCategory7: UIButton!
    @IBOutlet weak var btCategory8: UIButton!
    
    
    // private ShareListAdpater mListAdapter = null;
    // private ListView mListView = null;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KLog.d(tag: TAG, msg: "viewDidLoad");
        
        
        //     mHandler.sendEmptyMessage(CHECK_NETWORK);
        //     AppUtils.sendTrackerScreen(this, "모두가지화면");
        initialize()
    }
    
    func initialize(){
        setCategoryList()
    }
    
    func setButtonList(){
        mButtonList.append(btCategory0)
        mButtonList.append(btCategory1)
        mButtonList.append(btCategory2)
        mButtonList.append(btCategory3)
        mButtonList.append(btCategory4)
        mButtonList.append(btCategory5)
        mButtonList.append(btCategory6)
        mButtonList.append(btCategory7)
        mButtonList.append(btCategory8)
    }
    
    func setCategoryList() {
        let category0  = Category(name : "LIEF", code: 0)
        let category1 = Category(name : "LOVE", code : 1)
        let category2 = Category(name : "WORK", code : 2)
        let category3 = Category(name : "EDUCATION", code : 3)
        let category4 = Category(name : "FAMILY", code : 4)
        let category5 = Category(name : "FINANCE", code : 5)
        let category6 = Category(name : "DEVELOP", code : 6)
        let category7 = Category(name : "HEALTH", code : 7)
        let category8 = Category(name : "ETC", code : 8)
        
        mCategoryList.append(category0)
        mCategoryList.append(category1)
        mCategoryList.append(category2)
        mCategoryList.append(category3)
        mCategoryList.append(category4)
        mCategoryList.append(category5)
        mCategoryList.append(category6)
        mCategoryList.append(category7)
        mCategoryList.append(category8)
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        KLog.d(tag: TAG, msg: "onBackPressed");
        let uvc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewCtrl")
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
    }
    
    @IBAction func onClick(_ sender: Any) {
        var categoryCode : String = "1"
        
        switch(sender  as! UIButton ){
        case btCategory0:
            categoryCode = "1"
            KLog.d(tag: TAG, msg: "Category0")
        case btCategory1:
            categoryCode = "2"
            KLog.d(tag: TAG, msg: "Category1")
        case btCategory2:
            categoryCode = "3"
            KLog.d(tag: TAG, msg: "Category2")
        case btCategory3:
            categoryCode = "4"
            KLog.d(tag: TAG, msg: "Category3")
        case btCategory4:
            categoryCode = "5"
            KLog.d(tag: TAG, msg: "Category4")
        case btCategory5:
            categoryCode = "6"
            KLog.d(tag: TAG, msg: "Category5")
        case btCategory6:
            categoryCode = "7"
            KLog.d(tag: TAG, msg: "Category6")
        case btCategory7:
            categoryCode = "8"
            KLog.d(tag: TAG, msg: "Category7")
        case btCategory8:
            categoryCode = "9"
            KLog.d(tag: TAG, msg: "Category8")
            
            break;
        default:
            break;
            //  case R.id.share_list_detailBtn:
            //             int sharedIdx = (int) v.getTag();
            //             int idx = mBucketDataList.get(sharedIdx).getIdx();
            //             Intent intent = new Intent(this, ShareDetailActivity.class);
            //             intent.putExtra(ContextUtils.NUM_SHARE_BUCKET_IDX, idx + "");
            //             intent.putExtra(ContextUtils.OBJ_SHARE_BUCKET, mBucketDataList.get(sharedIdx));
            //             startActivity(intent);
            //             break;
        }
        handleMessage(what: SHARE_BUCKET_LIST, obj : categoryCode)
        
    }
    
    func onHttpReceive(type: Int, actionId: Int, data: String) {
        //     KLog.d(this.getClass().getSimpleName(), "@@ onHttpReceive actionId: " + actionId);
        //     KLog.d(this.getClass().getSimpleName(), "@@ onHttpReceive  type: " + type);
        //     KLog.d(this.getClass().getSimpleName(), "@@ onHttpReceive  obj: " + obj);
        //     String mData = (String) obj;
        //     boolean isValid = false;
        //     if (mData != null) {
        //         try {
        //             JSONObject json = new JSONObject(mData);
        //             isValid = json.getBoolean("isValid");
        //         } catch (JSONException e) {
        //             KLog.e(TAG, "@@ jsonException message : " + e.getMessage());
        //         }
        //     }
        //     if (actionId == IHttpReceive.CATEGORY_LIST) {
        //         KProgressDialog.setDataLoadingDialog(this, false, null, false);
        //         if (type == IHttpReceive.HTTP_OK && isValid == true) {
        //             try {
        //                 JSONObject json = new JSONObject(mData);
        //                 JSONArray jsonArray = json.getJSONArray("categoryVOList");
        //                 KLog.d(this.getClass().getSimpleName(), "@@ jsonArray :   " + jsonArray);
        //                 int size = jsonArray.length();
        //                 for (int i = 0; i < size; i++) {
        //                     JSONObject jsonObject = (JSONObject) jsonArray.get(i);
        //                     Category category = new Category();
        //                     category.setCategoryCode(jsonObject.getInt("categoryCode"));
        //                     category.setCategoryName(jsonObject.getString("categoryName"));
        //                     mCategoryList.add(category);
        //                 }
        //                 mHandler.sendEmptyMessage(SET_CATEGORY);
        //             } catch (JSONException e) {
        //                 KLog.e(TAG, "@@ jsonException message : " + e.getMessage());
        //                 mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
        //             }
        //         } else {
        //             mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
        //         }
        //     } else if (actionId == BUCKET_LIST) {
        //         KProgressDialog.setDataLoadingDialog(this, false, null, false);
        //         if (type == IHttpReceive.HTTP_OK && isValid == true) {
        //             try {
        //                 JSONObject json = new JSONObject(mData);
        //                 JSONArray jsonArray = json.getJSONArray("bucketList");
        //                 KLog.d(this.getClass().getSimpleName(), "@@ jsonArray :   " + jsonArray);
        //                 int size = jsonArray.length();
        //                 mBucketDataList.clear();
        //                 for (int i = 0; i < size; i++) {
        //                     JSONObject jsonObject = (JSONObject) jsonArray.get(i);
        //                     Bucket bucket = new Bucket();
        //                     bucket.setContent(jsonObject.getString("content"));
        //                     bucket.setPhone(jsonObject.getString("phone"));
        //                     bucket.setIdx(jsonObject.getInt("idx"));
        //                     bucket.setImageUrl(jsonObject.getString("imageUrl"));
        //                     bucket.setNickName(jsonObject.getString("nickName"));
        //                     bucket.setCategoryCode(jsonObject.getInt("categoryCode"));
        //                     bucket.setDate(jsonObject.getString("createDt"));
        
        //                     mBucketDataList.add(bucket);
        //                 }
        
        //                 if (mBucketDataList != null) {
        //                     if (mBucketDataList.size() > 0) {
        //                         realmMgr realmMgr = new realmMgr();
        //                         realmMgr.updateBucketShare(mBucketDataList);
        //                     }
        //                 }
        //                 mHandler.sendEmptyMessage(SET_BUCKETLIST);
        //             } catch (JSONException e) {
        //                 KLog.e(TAG, "@@ jsonException message : " + e.getMessage());
        //                 mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
        //             }
        //         } else {
        //             mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
        //         }
        //     }
    }
    
    func handleMessage(what : Int, obj : String) {
        switch (what) {
            //         case TOAST_MASSEGE:
            //             Toast.makeText(getApplicationContext(), (String) msg.obj, Toast.LENGTH_LONG).show();
            //             break;
            //         case CATEGORY_LIST:
            //             KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);
            //             HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_CATEGORY_URL, false, this, IHttpReceive.CATEGORY_LIST);
            //             httpUrlTaskManager.execute();
            //             break;
            //         case SET_CATEGORY:
            //             setButton();
            //             findViewById(R.id.share_category_view).setVisibility(View.VISIBLE);
            //             KLog.d(TAG, "@@ SET_CATEGORY");
            //             mHandler.sendEmptyMessage(SHARE_BUCKET_LIST);
            //             break;
            //         case SERVER_LOADING_FAIL:
            //             realmMgr realmMgr = new realmMgr();
            //             RealmResults<Bucket> infoList = realmMgr.selectBucketShareList();
            //             if (infoList != null) {
            //                 if (infoList.size() > 0) {
            //                     mBucketDataList.clear();
            //                     for (int i = 0; i < infoList.size(); i++) {
            //                         Bucket bucket = infoList.get(i);
            //                         mBucketDataList.add(bucket);
            //                     }
            //                     mHandler.sendEmptyMessage(SET_BUCKETLIST);
            //                 }
            //             } else {
            //                 KLog.d(TAG, "@@ SERVER_LOADING_FAIL");
            //                 String message = getString(R.string.server_fail_string);
            //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
            //                 finish();
            //             }
        //             break;
        case SHARE_BUCKET_LIST:
            var data : String = String(obj)
            if (data == nil) {
                data = ContextUtils.DEFULAT_SHARE_BUCKET_IDX
            }
            //             KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);
            
            var url  = ContextUtils.KBUCKET_BUCKET_LIST_URL + "?idx=1"
            let  httpUrlTaskManager : HttpUrlTaskManager =  HttpUrlTaskManager(url : url, post : true, receive : self, id : ConstHTTP.BUCKET_LIST);
            httpUrlTaskManager.actionTask();
            
            //                 HashMap<String, Object> map = new HashMap<String, Object>();
            //                 map.put("idx", data);
            //                 httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
            break;
            //         case SET_BUCKETLIST:
            //             mListView = (ListView) findViewById(R.id.share_list_listview);
            //             mListAdapter = new ShareListAdpater(this, R.layout.share_list_line, mBucketDataList, this);
            //             mListView.setAdapter(mListAdapter);
            //             break;
            //         case CHECK_NETWORK:
            //             boolean isConnect = NetworkUtils.isConnectivityStatus(this);
            //             if (!isConnect) {
            //                 String connectMsg = getString(R.string.check_network);
            //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, connectMsg));
            //             } else {
            //                 mHandler.sendEmptyMessage(CATEGORY_LIST);
            //             }
        //             break;
        default:
            break;
        }
    }
    
    
}
