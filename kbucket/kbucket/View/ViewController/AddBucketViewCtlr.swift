//
//  AddBucketViewCtlr.swift
//   버킷 추가
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class AddBucketViewCtlr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "AddBucketViewCtlr", msg: "viewDidLoad");
    }

    // private final String TAG = this.getClass().getSimpleName();
    // private ArrayList<PostData> mBucketDataList = null;
    // private ArrayList<String> mDataList = null;
    // private ListAdpater mListAdapter = null;
    // private ListView mListView = null;
    // private SQLQuery mSqlQuery = null;

    // private boolean mbVisible = true;
    // private ConfirmPopup mConfirmPopup = null;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.interest_bucket_list_activity);
    //     //setBackgroundColor();
    //     setTextPont();
    //     setListData();

    //     mBucketDataList = new ArrayList<PostData>();
    //     mListView = (ListView) findViewById(R.id.interest_bucket_list_listview);
    //     ((Button) findViewById(R.id.interest_bucket_list_add)).setOnClickListener(this);
    //     mSqlQuery = new SQLQuery();
    //     mListAdapter = new ListAdpater(this, R.layout.interest_bucket_list_line, mDataList, this);
    //     mListView.setAdapter(mListAdapter);
    //     AppUtils.sendTrackerScreen(this, "관심버킷추가화면");
    // }

    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.write_back_color).setBackgroundColor(color);
    //     }
    // }

    // @Override
    // public void finish() {
    //     super.finish();
    //     this.overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    // }

    // @Override
    // public void onClick(View v) {
    //     switch (v.getId()) {
    //         case R.id.interest_bucket_list_add:
    //             mbVisible = !mbVisible;
    //             mListAdapter.setDataVisible(mbVisible);
    //             break;
    //         case R.id.bucket_list_modifyBtn://추가
    //             int index = Integer.valueOf((String) v.getTag());
    //             String data = mDataList.get(index);
    //             addDBData(data);
    //             break;
    //         case R.id.bucket_list_deleteBtn://삭제
    //             index = Integer.valueOf((String) v.getTag());
    //             data = mDataList.get(index);
    //             removeDBData(data);
    //             break;
    //     }
    // }

    // private void setListData() {
    //     mDataList = new ArrayList<String>();
    //     String[] strArray = getResources().getStringArray(R.array.dream100);
    //     for(int i=0; i<strArray.length; i++){
    //         mDataList.add(strArray[i]);
    //     }
    // }

    // /**
    //  * DB 데이타 동기화하기(삭제)
    //  */
    // private void removeDBData(String Content) {
    //     mSqlQuery.deleteUserBucket(getApplicationContext(), Content);
    //     boolean inContainsBucket = mSqlQuery.containsKbucket(getApplicationContext(), Content);
    //     if (!inContainsBucket) {
    //         String message = getString(R.string.share_delete_popup_ok);
    //         Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //     }
    // }

    // /**
    //  * DB 데이타 동기화하기(추가)
    //  *
    //  * @param Content 내용
    //  */
    // private void addDBData(String Content) {
    //     boolean inContainsBucket = mSqlQuery.containsKbucket(getApplicationContext(), Content);
    //     String message;
    //     if (!inContainsBucket) {
    //         Date dateTime = new Date();
    //         String date = DateUtils.getStringDateFormat(DateUtils.DATE_YYMMDD_PATTER, dateTime);
    //         mSqlQuery.insertUserSetting(getApplicationContext(), Content, date, "N", "");
    //         message = getString(R.string.share_add_popup_ok);
    //     } else {
    //         message = getString(R.string.check_input_bucket_string);
    //     }
    //     Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    // }

    // @Override
    // protected void onStop() {
    //     super.onStop();
    //     mDataList = null;
    //     mBucketDataList = null;
    // }

    // private void setTextPont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((Button) findViewById(R.id.interest_bucket_list_text)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.interest_bucket_list_add)).setTypeface(typeFace);
    // }
}