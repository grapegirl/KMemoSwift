//
//  WriteViewCtlr.swift
//  kbucket
//
//  Created by 김미혜 on 2017. 8. 20..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit
import Foundation

class WriteViewCtrl : UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    private let TAG : String = "WriteViewCtrl"
    
    private var mBucketDataList = Array<PostData>()
    private var mDataList = Array<String>()
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var btBack: UIButton!
    @IBOutlet weak var etEdit: UITextField!
    
    @IBOutlet weak var btAdd: UIButton!
    @IBOutlet weak var btSortName: UIButton!
    @IBOutlet weak var btSortLastest: UIButton!
    @IBOutlet weak var btSortDeadLine: UIButton!
    
    public var temp :  String = ""
    private var mSqlQuery  : SQLQuery? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: TAG, msg: "viewDidLoad");
        
        mTableView.delegate = self
        mTableView.dataSource = self
        
        initialize()
    }
    
    func initialize()
    {
        mDataList.append("Test1")
        mDataList.append("Test2")
        mDataList.append("Test3")
        mDataList.append("Test4")
        mDataList.append("Test5")
        
        mSqlQuery = SQLQuery()
        print("@@ 디렉토리 : " + NSHomeDirectory())
        
        //     setBackgroundColor();
        //     setTextPont();
        
        
        //     mMemoSortButton = (Button) findViewById(R.id.sort_memo);
        //     mMemoSortButton.setOnClickListener(this);
        //     mDateSortButton = (Button) findViewById(R.id.sort_date);
        //     mDateSortButton.setOnClickListener(this);
        //     ((Button) findViewById(R.id.sort_deadline)).setOnClickListener(this);
        
        //     ((EditText) findViewById(R.id.write_layout_titleView)).setOnKeyListener(this);
        
        
        //     mListAdapter = new ListAdpater(this, R.layout.bucket_list_line, mDataList, this);
        //     mListView.setAdapter(mListAdapter);
        //     setListData();
        //     AppUtils.sendTrackerScreen(this, "가지작성화면");
        
    }
    
    /**
     * 정렬 기능
     */
    func sort(sort : String) {
        //         String sort = (String) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.KBUCKET_SORT_KEY, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
        //         KLog.d(TAG, "@@ Sort : " + sort);
        //         if (strSort == null) {
        //             mListAdapter.setDataList(mDataList);
        //             return;
        //         }
        
        KLog.d(tag: TAG, msg: "Sort : " + sort);
        if (sort == (ContextUtils.SORT_DATE)) {
            mDataList.sort(){$0 < $1}
        } else if (sort == (ContextUtils.SORT_MEMO)) {
            mDataList.sort(){$0 < $1}
        } else {
            mDataList.sort(){$0 > $1}
        }
        
        print(mDataList)
        self.mTableView.reloadData()
        
        //         for (int i = 0; i < mBucketDataList.size(); i++) {
        //             PostData data = mBucketDataList.get(i);
        //             if (data.getCompleteYN().equals("Y")) {
        //                 continue;
        //             }
        //             mDataList.add(data.getContents());
        //         }
        //         if (sort.equals(ContextUtils.SORT_DATE)) {
        //
        //             Collections.reverse(mDataList);
        //         }
        //         mListAdapter.setDataList(mDataList);
    }
    
    
    @IBAction func onBackPressed(_ sender: Any) {
        KLog.d(tag: TAG, msg: "onBackPressed");
        let uvc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewCtrl")
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
    }
    
    @IBAction func onClick(_ sender: Any) {
        if((sender  as! UIButton) == btAdd){
            let strText : String = etEdit.text!
            if(checkduplicateData(checkString : strText)){
                Toast.showToast(message : "중복된 내용이 있습니다")
            }else{
                mDataList.append(strText)
                if(mSqlQuery != nil){
                    mSqlQuery?.insertUserSetting(contents: strText, date: "", completeYN: "N", completedDate: "")
                }

                // Get the default Realm
                let realm = try! Realm()

                // Query Realm for all dogs less than 2 years old
                let bucketList = realm.objects(Bucket.self)
                KLog.d(tag: TAG, msg: "bucketList select : " + bucketList);

                // Delete all objects from the realm
                // try! realm.write {
                //     realm.deleteAll()
                // }

                // Delete an object with a transaction
                // try! realm.write {
                //     realm.delete(cheeseBook)
                // }
            }
            self.mTableView.reloadData()
            etEdit.text = ""
        }else if((sender as! UIButton) == btSortLastest){
            KLog.d(tag: TAG, msg: "onClick btSortLastest");
            sort(sort: ContextUtils.SORT_DATE)
            //            SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KBUCKET_SORT_KEY, ContextUtils.SORT_DATE);
        }else if((sender as! UIButton) == btSortName){
            KLog.d(tag: TAG, msg: "onClick btSortName");
            
            //            SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KBUCKET_SORT_KEY, ContextUtils.SORT_MEMO);
            //
            sort(sort: ContextUtils.SORT_MEMO)
        }else if((sender as! UIButton) == btSortDeadLine){
            KLog.d(tag: TAG, msg: "onClick btSortDeadLine");
            sort(sort: ContextUtils.SORT_DEADLINE)
            //
            //            SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KBUCKET_SORT_KEY, ContextUtils.SORT_DEADLINE);
        }
    }
    
    /**
     * 중복 데이타 검사 메소드
     *
     * @param Content 추가할 내용
     * @return 중복 데이타 여부(true- 중복된 데이타 있음, false - 없음)
     */
    func checkduplicateData(checkString : String) -> Bool
    {
        if mDataList.contains(checkString){
            return true;
        }
        return false;
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        KLog.d(tag: TAG, msg: "viewDidDisappear");
        if(mDataList != nil && mDataList.count > 0){
            mDataList.removeAll()
        }
        if(mBucketDataList != nil && mBucketDataList.count > 0){
            mBucketDataList.removeAll()
        }
    }
    
    
    
    
    
    // @Override
    // public void onClick(View v) {
    //     switch (v.getId()) {
    //         // 삭제 버튼
    //         case R.id.bucket_list_deleteBtn:
    //             int index = Integer.valueOf((String) v.getTag());
    //             removeDBData(mDataList.get(index));
    //             mDataList.remove(index);
    //             mListAdapter.setDataList(mDataList);
    //             break;
    //         // 수정 버튼
    //         case R.id.bucket_list_modifyBtn:
    //             index = Integer.valueOf((String) v.getTag());
    //             Intent intent = new Intent(this, WriteDetailActivity.class);
    //             intent.putExtra("CONTENTS", mDataList.get(index));
    //             intent.putExtra("BACK", ContextUtils.VIEW_WRITE);
    //             startActivity(intent);
    //             finish();
    //             break;
    //
    //     }
    // }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDataList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mTableView.dequeueReusableCell(withIdentifier: "FirstCustomCell", for: indexPath) as! FirstCustomCell
        
        cell.btEdt.text = mDataList[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(tableview: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableview.deselectRow(at: indexPath as IndexPath, animated: true)
        let row = indexPath.row
        print(mDataList[row])
    }
    
    
    
    
  
    
    // @Override
    // public boolean onKey(View v, int keyCode, KeyEvent event) {
    //     if (event.getAction() == KeyEvent.ACTION_DOWN) {
    //         if (keyCode == KeyEvent.KEYCODE_ENTER) {
    //             //엔터입력시 할일 처리
    //             String editText = ((EditText) findViewById(R.id.write_layout_titleView)).getText().toString();
    //             if (checkduplicateData(editText)) {
    //                 String message = getString(R.string.check_input_bucket_string);
    //                 Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //             } else {
    //                 addDBData(editText);
    //             }
    //             ((EditText) findViewById(R.id.write_layout_titleView)).setText("");
    //             ((EditText) findViewById(R.id.write_layout_titleView)).setNextFocusDownId(R.id.write_layout_titleView);
    //         }
    
    //     }
    //     return false;
    // }
    
    // /**
    //  * DB 데이타 불러와서 데이타 표시하기
    //  */
    // private void setListData() {
    //     LinkedList<LinkedHashMap<String, String>> map = mSqlQuery.selectKbucket(getApplicationContext());
    //     if (map == null) {
    //         return;
    //     }
    //     realmMgr mgr = new realmMgr();
    //     for (int i = 0; i < map.size(); i++) {
    //         LinkedHashMap<String, String> memoMap = map.get(i);
    //         PostData postData = new PostData("", memoMap.get("contents"), memoMap.get("date"), i);
    //         postData.setImageName(memoMap.get("image_path"));
    //         postData.setCompleteYN(memoMap.get("complete_yn"));
    //         postData.setDeadLine(memoMap.get("deadline"));
    //         mBucketDataList.add(postData);
    
    //         if (memoMap.get("complete_yn").equals("Y")) {
    //             continue;
    //         }
    //         mDataList.add(memoMap.get("contents"));
    //     }
    //     if (mBucketDataList != null) {
    //         //realm db 갱신하기
    //         if (mBucketDataList.size() > 0) {
    //             mgr.insertPostData(mBucketDataList);
    //         }
    //     }
    //     sort();
    // }
    
    // /**
    //  * DB 데이타 동기화하기(삭제)
    //  */
    // private void removeDBData(String Content) {
    //     KLog.d(this.getClass().getSimpleName(), "@@ remove Data Contents : " + Content);
    //     mSqlQuery.deleteUserBucket(getApplicationContext(), Content);
    //     realmMgr.deletePostData(Content);
    // }
    
    // /**
    //  * DB 데이타 동기화하기(추가)
    //  *
    //  * @param Content 내용
    //  */
    // private void addDBData(String Content) {
    //     mDataList.add(Content);
    //     Collections.reverse(mDataList);
    //     mListAdapter = new ListAdpater(this, R.layout.bucket_list_line, mDataList, this);
    //     mListView.setAdapter(mListAdapter);
    //     Date dateTime = new Date();
    //     String date = DateUtils.getStringDateFormat(DateUtils.DATE_YYMMDD_PATTER, dateTime);
    //     mSqlQuery.insertUserSetting(getApplicationContext(), Content, date, "N", "");
    
    //     PostData postData = new PostData("", Content, date, mBucketDataList.size());
    //     postData.setImageName("");
    //     postData.setCompleteYN("N");
    //     mBucketDataList.add(postData);
    //     realmMgr.insertPostData(postData);
    // }
    
    
    
    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.write_back_color).setBackgroundColor(color);
    //     }
    // }
    
    // private void setTextPont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((Button) findViewById(R.id.write_layout_addBtn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.sort_memo)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.sort_date)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.sort_deadline)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.write_list_text)).setTypeface(typeFace);
    // }
    
}
