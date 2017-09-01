//
//  RankListViewCtlr.swift
//  버킷 랭킹 목록
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class RankListViewCtlr: UIViewController {

    private let TAG : String = "RankListViewCtlr"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: TAG, msg: "viewDidLoad");
    }

    // private final String TAG = this.getClass().getSimpleName();
    // private Handler mHandler = null;

    // private ArrayList<BucketRank> mBucketDataList = null;
    // private RankListAdpater mListAdapter = null;
    // private ListView mListView = null;
    // private int mBucketRankComment;
    // private int mBucketRankIdx = -1;

    // private final int TOAST_MASSEGE = 10;
    // private final int SERVER_LOADING_FAIL = 20;
    // private final int LOAD_BUCKET_RANK = 30;
    // private final int SET_LIST = 40;
    // private final int SEND_BUCKET_RANK = 50;
    // private final int CHECK_NETWORK = 70;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.rank_list_activity);
    //     setBackgroundColor();
    //     setTextPont();
    //     mHandler = new Handler(this);
    //     mBucketDataList = new ArrayList<BucketRank>();
    //     mHandler.sendEmptyMessage(CHECK_NETWORK);
    //     AppUtils.sendTrackerScreen(this, "버킷랭킹화면");
    // }

    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.share_back_color).setBackgroundColor(color);
    //     }
    // }

    // @Override
    // public void finish() {
    //     super.finish();
    //     this.overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    // }

    // @Override
    // public void onHttpReceive(int type, int actionId, Object obj) {
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
    //     if (actionId == RANK_LIST) {
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
    //                     BucketRank bucket = new BucketRank();
    //                     bucket.setCategoryCode(jsonObject.getInt("categoryCode"));
    //                     bucket.setContent(jsonObject.getString("content"));
    //                     bucket.setIdx(jsonObject.getInt("idx"));
    //                     bucket.setBestCnt(jsonObject.getInt("bestCnt"));
    //                     bucket.setGoodCnt(jsonObject.getInt("goodCnt"));
    //                     bucket.setSoSoCnt(jsonObject.getInt("ssoCnt"));
    //                     bucket.setUserComment(jsonObject.getInt("comment"));
    //                     mBucketDataList.add(bucket);
    //                 }
    //                 if (mBucketDataList != null && mBucketDataList.size() > 0) {
    //                     realmMgr realmMgr = new realmMgr();
    //                     realmMgr.updateBucketRanking(mBucketDataList);
    //                 }
    //                 mHandler.sendEmptyMessage(SET_LIST);
    //             } catch (JSONException e) {
    //                 KLog.e(TAG, "@@ jsonException message : " + e.getMessage());
    //                 mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
    //             }
    //         } else {
    //             mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
    //         }
    //     } else if (actionId == RANK_UPDATE_COMMENT) {
    //         KProgressDialog.setDataLoadingDialog(this, false, null, false);
    //         if (type == IHttpReceive.HTTP_OK && isValid == true) {
    //             mBucketDataList.clear();
    //             mHandler.sendEmptyMessage(LOAD_BUCKET_RANK);
    //         } else {
    //             mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
    //         }

    //     }
    // }

    // @Override
    // public boolean handleMessage(Message msg) {
    //     switch (msg.what) {
    //         case TOAST_MASSEGE:
    //             Toast.makeText(getApplicationContext(), (String) msg.obj, Toast.LENGTH_LONG).show();
    //             break;
    //         case SERVER_LOADING_FAIL:
    //             realmMgr realmMgr = new realmMgr();
    //             RealmResults<BucketRank> infoList = realmMgr.selectBucketRankList();
    //             if(infoList != null){
    //                 if (infoList.size() > 0) {
    //                     mBucketDataList.clear();
    //                     for(int i=0; i<infoList.size(); i++){
    //                         mBucketDataList.add(infoList.get(i));
    //                     }
    //                     mHandler.sendEmptyMessage(SET_LIST);
    //                 }
    //             }else{
    //                 KLog.d(TAG, "@@ SERVER_LOADING_FAIL");
    //                 String message = getString(R.string.server_fail_string);
    //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
    //                 finish();
    //             }
    //             break;
    //         case LOAD_BUCKET_RANK:
    //             KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);
    //             String userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //             HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_RANK_LIST_URL, true, this, IHttpReceive.RANK_LIST);
    //             HashMap<String, Object> map = new HashMap<String, Object>();
    //             map.put("pageNm", "1");
    //             map.put("nickname", userNickName);
    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
    //             break;
    //         case SET_LIST:
    //             mListView = (ListView) findViewById(R.id.rank_list_listview);
    //             mListAdapter = new RankListAdpater(this, R.layout.rank_list_line, mBucketDataList, this);
    //             mListView.setAdapter(mListAdapter);
    //             break;
    //         case SEND_BUCKET_RANK:
    //             KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);
    //             userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //             httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_RANK_COMMENT, true, this, IHttpReceive.RANK_UPDATE_COMMENT);
    //             map = new HashMap<String, Object>();
    //             map.put("idx", mBucketRankIdx);
    //             map.put("comment", mBucketRankComment);
    //             map.put("nickname", userNickName);
    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
    //             break;
    //         case CHECK_NETWORK:
    //             boolean isConnect = NetworkUtils.isConnectivityStatus(this);
    //             if(!isConnect){
    //                 String connectMsg = getString(R.string.check_network);
    //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, connectMsg));
    //             }else{
    //                 mHandler.sendEmptyMessage(LOAD_BUCKET_RANK);
    //             }
    //             break;
    //     }
    //     return false;
    // }

    // @Override
    // public void onClick(View v) {
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
    //     }

    //     Integer nIndex = (Integer) v.getTag();
    //     boolean isSendServer = getCommentCount(nIndex);
    //     // 의견이 없으면 서버에 반영
    //     if (!isSendServer) {
    //         mHandler.sendEmptyMessage(SEND_BUCKET_RANK);
    //         mBucketRankIdx = nIndex;
    //     } else {
    //         mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, "이미 의견을 반영했습니다! "));
    //     }
    // }

    // private void setTextPont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((Button) findViewById(R.id.rank_list_text)).setTypeface(typeFace);
    // }

    // private boolean getCommentCount(int index) {
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
    //     return false;
    // }
}
