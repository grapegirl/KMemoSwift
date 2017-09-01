//
//  ShareListViewCtlr.swift
//  공유 목록
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class ShareListViewCtlr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "ShareListViewCtlr", msg: "viewDidLoad");
    }

    // private final String TAG = this.getClass().getSimpleName();
    // private ArrayList<Category> mCategoryList = null;
    // private android.os.Handler mHandler = null;
    // private Button[] mButton = new Button[9];

    // private ArrayList<Bucket> mBucketDataList = null;
    // private ShareListAdpater mListAdapter = null;
    // private ListView mListView = null;

    // private final int TOAST_MASSEGE = 10;
    // private final int CATEGORY_LIST = 20;
    // private final int SET_CATEGORY = 30;
    // private final int SERVER_LOADING_FAIL = 40;
    // private final int SHARE_BUCKET_LIST = 50;
    // private final int SET_BUCKETLIST = 60;
    // private final int CHECK_NETWORK = 70;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.share_list_activity);
    //     setBackgroundColor();
    //     setTextPont();
    //     mHandler = new android.os.Handler(this);
    //     mCategoryList = new ArrayList<Category>();
    //     mBucketDataList = new ArrayList<Bucket>();
    //     mHandler.sendEmptyMessage(CHECK_NETWORK);
    //     AppUtils.sendTrackerScreen(this, "모두가지화면");
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
    // }

    // @Override
    // public boolean handleMessage(Message msg) {
    //     switch (msg.what) {
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
    //         case SHARE_BUCKET_LIST:
    //             String data = (String) msg.obj;
    //             if (data == null) {
    //                 data = ContextUtils.DEFULAT_SHARE_BUCKET_IDX;
    //                 setButtonSelected(R.id.category_item0);
    //             }
    //             KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);
    //             httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_BUCKET_LIST_URL, true, this, IHttpReceive.BUCKET_LIST);
    //             HashMap<String, Object> map = new HashMap<String, Object>();
    //             map.put("idx", data);
    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
    //             break;
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
    //     }
    //     return false;
    // }

    // /**
    //  * 버튼에 해당 키값 설정하기
    //  */
    // private void setButton() {
    //     mButton[0] = (Button) findViewById(R.id.category_item0);
    //     mButton[1] = (Button) findViewById(R.id.category_item1);
    //     mButton[2] = (Button) findViewById(R.id.category_item2);
    //     mButton[3] = (Button) findViewById(R.id.category_item3);
    //     mButton[4] = (Button) findViewById(R.id.category_item4);
    //     mButton[5] = (Button) findViewById(R.id.category_item5);
    //     mButton[6] = (Button) findViewById(R.id.category_item6);
    //     mButton[7] = (Button) findViewById(R.id.category_item7);
    //     mButton[8] = (Button) findViewById(R.id.category_item8);

    //     for (int i = 0; i < mButton.length; i++) {
    //         mButton[i].setOnClickListener(this);
    //         Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //         mButton[i].setTypeface(typeFace);
    //         mButton[i].setText(mCategoryList.get(i).getCategoryName());
    //         mButton[i].setTag(mCategoryList.get(i).getCategoryCode());
    //     }
    // }

    // /**
    //  * 선택한 카데고리 버튼 색상 변경하는 메소드
    //  *
    //  * @param id
    //  */
    // private void setButtonSelected(int id) {
    //     for (int i = 0; i < mButton.length; i++) {
    //         if (mButton[i].getId() == id) {
    //             mButton[i].setBackgroundColor(0xFFFFFFFF);
    //             mButton[i].setTextColor(0xFF99CC00);
    //         } else {
    //             mButton[i].setBackgroundColor(0xFF99CC00);
    //             mButton[i].setTextColor(0xFFFFFFFF);
    //         }
    //     }
    // }

    // @Override
    // public void onClick(View v) {
    //     switch (v.getId()) {
    //         case R.id.category_item0:
    //         case R.id.category_item1:
    //         case R.id.category_item2:
    //         case R.id.category_item3:
    //         case R.id.category_item4:
    //         case R.id.category_item5:
    //         case R.id.category_item6:
    //         case R.id.category_item7:
    //         case R.id.category_item8:
    //             int categoryCode = (int) v.getTag();
    //             setButtonSelected(v.getId());
    //             mHandler.sendMessage(mHandler.obtainMessage(SHARE_BUCKET_LIST, categoryCode + ""));
    //             break;
    //         case R.id.share_list_detailBtn:
    //             int sharedIdx = (int) v.getTag();
    //             int idx = mBucketDataList.get(sharedIdx).getIdx();
    //             Intent intent = new Intent(this, ShareDetailActivity.class);
    //             intent.putExtra(ContextUtils.NUM_SHARE_BUCKET_IDX, idx + "");
    //             intent.putExtra(ContextUtils.OBJ_SHARE_BUCKET, mBucketDataList.get(sharedIdx));
    //             startActivity(intent);
    //             break;
    //     }
    // }

    // private void setTextPont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((Button) findViewById(R.id.share_list_text)).setTypeface(typeFace);
    // }
}
