//
//  AddBucketView.swift
//   버킷 추가
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class AddBucketView: UIViewController {

    private let TAG : String = "AddBucketView"

    private var mBucketDataList = Array<PostData>()
    private var mDataList  = ArrayList<String>()

    private var mSqlQuery  : SQLQuery? = nil
    private var mbVisible : Bool  = true

    // private ListAdpater mListAdapter = null;
    // private ListView mListView = null;
    // private ConfirmPopup mConfirmPopup = null;

    override func viewDidLoad() {
        super.viewDidLoad()
        KLog.d(tag: TAG, msg: "viewDidLoad")
        initialize()
    }

    func initialize(){
        setListData()
    //     mListView = (ListView) findViewById(R.id.interest_bucket_list_listview);
    //     ((Button) findViewById(R.id.interest_bucket_list_add)).setOnClickListener(this);
        mSqlQuery = SQLQuery()
    //     mListAdapter = new ListAdpater(this, R.layout.interest_bucket_list_line, mDataList, this);
    //     mListView.setAdapter(mListAdapter);
    //     AppUtils.sendTrackerScreen(this, "관심버킷추가화면");
    }

    func finish(){
        KLog.d(tag: TAG, msg: "finish")
        deleteImageResource()
        let uvc = self.storyboard?.instantiateViewController(withIdentifier: ContextUtils.MAIN_VIEW)
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
    }

    @IBAction func onClick(_ sender: Any) {
            switch(sender  as! UIButton ){
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
    }

    private func setListData() {
    //     String[] strArray = getResources().getStringArray(R.array.dream100);
    //     for(int i=0; i<strArray.length; i++){
    //         mDataList.add(strArray[i]);
    //     }
    }

    /**
     * DB 데이타 동기화하기(삭제)
     */
    private func removeDBData(Content : String) {
        // mSqlQuery.deleteUserBucket(getApplicationContext(), Content);
        // boolean inContainsBucket = mSqlQuery.containsKbucket(getApplicationContext(), Content);
        // if (!inContainsBucket) {
        //     String message = getString(R.string.share_delete_popup_ok);
        //     Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
        // }
    }

    /**
     * DB 데이타 동기화하기(추가)
     *
     * @param Content 내용
     */
    private func addDBData(Content : String) {
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
    }
}