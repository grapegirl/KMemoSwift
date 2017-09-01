//
//  NoticeViewCtlr.swift
//  공지사항
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class NoticeViewCtlr: UIViewController {

   private let TAG : String = "NoticeViewCtlr"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: TAG, msg: "viewDidLoad");
    }

    // private final String TAG = this.getClass().getSimpleName();
    // private Handler mHandler = null;
    // private ArrayList<UpdateApp> mList = null;
    // private ExpandableListView mExtendableListView = null;

    // private final int TOAST_MASSEGE = 10;
    // private final int LOAD_NOTICE_LIST = 20;
    // private final int SET_NOTICE_LIST = 30;
    // private final int SERVER_LOADING_FAIL = 40;

    // private ArrayList<String> mGroupList = null;
    // private ArrayList<ArrayList<String>> mChildList = null;
    // private ArrayList<String> mChildListContent = null;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.notice_extended);
    //     setBackgroundColor();
    //     setTextPont();

    //     mHandler = new Handler(this);
    //     mList = new ArrayList<UpdateApp>();
    //     mGroupList = new ArrayList<String>();
    //     mChildList = new ArrayList<ArrayList<String>>();
    //     KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);

    //     mHandler.sendEmptyMessage(LOAD_NOTICE_LIST);
    //     AppUtils.sendTrackerScreen(this, "공지화면");
    // }

    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.notice_back_color).setBackgroundColor(color);
    //     }
    // }

    // @Override
    // public void finish() {
    //     super.finish();
    //     this.overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    // }

    // @Override
    // public void onHttpReceive(int type, int actionId, Object obj) {
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
    //     if (actionId == IHttpReceive.NOTICE_LIST) {
    //         if (type == IHttpReceive.HTTP_OK && isValid == true) {
    //             try {
    //                 JSONObject json = new JSONObject(mData);
    //                 JSONArray jsonArray = json.getJSONArray("updateVOList");
    //                 KLog.d(this.getClass().getSimpleName(), "@@ jsonArray :   " + jsonArray);
    //                 int size = jsonArray.length();
    //                 mList.clear();
    //                 mGroupList.clear();
    //                 mChildList.clear();
    //                 for (int i = 0; i < size; i++) {
    //                     JSONObject jsonObject = (JSONObject) jsonArray.get(i);
    //                     UpdateApp updateApp = new UpdateApp();
    //                     updateApp.setVersionCode(jsonObject.getInt("versionCode"));
    //                     updateApp.setContent(jsonObject.getString("updateContent"));
    //                     mList.add(updateApp);

    //                     String mTitle = jsonObject.getString("updateContent").split("\n")[0];
    //                     mGroupList.add(mTitle);
    //                     mChildListContent = new ArrayList<String>();
    //                     mChildListContent.add(jsonObject.getString("updateContent"));
    //                     mChildList.add(mChildListContent);
    //                 }

    //                 if (mList != null && mList.size() > 0) {
    //                     realmMgr realmMgr = new realmMgr();
    //                     realmMgr.updateNotice(mList);
    //                 }
    //                 mHandler.sendEmptyMessage(SET_NOTICE_LIST);
    //             } catch (JSONException e) {
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
    //         case LOAD_NOTICE_LIST:
    //             HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_NOTICE_URL, false, this, IHttpReceive.NOTICE_LIST);
    //             httpUrlTaskManager.execute();
    //             break;
    //         case SET_NOTICE_LIST:
    //             KProgressDialog.setDataLoadingDialog(this, false, null, false);
    //             mExtendableListView = (ExpandableListView) findViewById(R.id.notice_listview_extended);
    //             mExtendableListView.setAdapter(new BaseExpandableAdapter(this, mGroupList, mChildList));
    //             break;
    //         case TOAST_MASSEGE:
    //             Toast.makeText(getApplicationContext(), (String) msg.obj, Toast.LENGTH_LONG).show();
    //             break;
    //         case SERVER_LOADING_FAIL:
    //             realmMgr realmMgr = new realmMgr();
    //             RealmResults<UpdateApp> infoList = realmMgr.selectNoticeList();
    //             if (infoList != null) {
    //                 if (infoList.size() > 0) {
    //                     mList.clear();
    //                     mGroupList.clear();
    //                     mChildList.clear();
    //                     for (int i = 0; i < infoList.size(); i++) {
    //                         UpdateApp updateApp = infoList.get(i);
    //                         mList.add(updateApp);
    //                         String mTitle = updateApp.getContent().split("\n")[0];
    //                         mGroupList.add(mTitle);
    //                         mChildListContent = new ArrayList<String>();
    //                         mChildListContent.add(updateApp.getContent());
    //                         mChildList.add(mChildListContent);
    //                     }
    //                     mHandler.sendEmptyMessage(SET_NOTICE_LIST);
    //                 }
    //             } else {
    //                 KProgressDialog.setDataLoadingDialog(this, false, null, false);
    //                 KLog.d(TAG, "@@ SERVER_LOADING_FAIL");
    //                 String message = getString(R.string.server_fail_string);
    //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
    //                 finish();
    //             }
    //             break;
    //     }
    //     return false;
    // }

    // private void setTextPont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((Button) findViewById(R.id.notice_list_text)).setTypeface(typeFace);
    // }
}
