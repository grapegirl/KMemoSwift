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
        
    }
    
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
    

    @IBAction func onBackPressed(_ sender: Any) {
        KLog.d(tag: TAG, msg: "onBackPressed");
        let uvc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewCtrl")
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
    }

    @IBAction func onClick(_ sender: Any) {
          KLog.d(tag: TAG, msg: "onClick");
        
        let strText : String = etEdit.text!
        
        //중복 체크하기
        if(checkduplicateData(checkString : strText)){
            Toast.showToast(message : "중복된 내용이 있습니다")
        }else{
            mDataList.append(strText)
        }
        let strCont = String(mDataList.count)
        KLog.d(tag: TAG, msg: "onClick mDataList : " + strCont);
        
        self.mTableView.reloadData()
        
        etEdit.text = ""
        
        
       
    }
    
    
    func checkduplicateData(checkString : String) -> Bool
    {
        if mDataList.contains(checkString){
            return true;
        }
        return false;
    }
    // private Button mButton;
    // private Button mMemoSortButton;
    // private Button mDateSortButton;

    // /**
    //  * 모든 버킷 목록
    //  */
    // private ArrayList<PostData> mBucketDataList = null;
    // private ArrayList<String> mDataList = null;

    // private SQLQuery mSqlQuery = null;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.write_bucket_layout);
    //     setBackgroundColor();
    //     setTextPont();

    //     mDataList = new ArrayList<String>();
    //     mBucketDataList = new ArrayList<PostData>();
    //     mListView = (ListView) findViewById(R.id.write_list_listview);
    //     mButton = (Button) findViewById(R.id.write_layout_addBtn);
    //     mButton.setOnClickListener(this);

    //     mMemoSortButton = (Button) findViewById(R.id.sort_memo);
    //     mMemoSortButton.setOnClickListener(this);
    //     mDateSortButton = (Button) findViewById(R.id.sort_date);
    //     mDateSortButton.setOnClickListener(this);
    //     ((Button) findViewById(R.id.sort_deadline)).setOnClickListener(this);

    //     ((EditText) findViewById(R.id.write_layout_titleView)).setOnKeyListener(this);

    //     mSqlQuery = new SQLQuery();
    //     mListAdapter = new ListAdpater(this, R.layout.bucket_list_line, mDataList, this);
    //     mListView.setAdapter(mListAdapter);
    //     setListData();
    //     AppUtils.sendTrackerScreen(this, "가지작성화면");
    // }

    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.write_back_color).setBackgroundColor(color);
    //     }
    // }


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
    //         //메모 정렬순
    //         case R.id.sort_memo:
    //             SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KBUCKET_SORT_KEY, ContextUtils.SORT_MEMO);
    //             sort();
    //             break;
    //         //날짜 정렬순
    //         case R.id.sort_date:
    //             SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KBUCKET_SORT_KEY, ContextUtils.SORT_DATE);
    //             sort();
    //             break;
    //         //기한 정렬순
    //         case R.id.sort_deadline:
    //             SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KBUCKET_SORT_KEY, ContextUtils.SORT_DEADLINE);
    //             sort();
    //             break;
    //     }
    // }

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

    // /**
    //  * 중복 데이타 검사 메소드
    //  *
    //  * @param Content 추가할 내용
    //  * @return 중복 데이타 여부(true- 중복된 데이타 있음, false - 없음)
    //  */
    // private boolean checkduplicateData(String Content) {
    //     for (int i = 0; i < mBucketDataList.size(); i++) {
    //         if (mBucketDataList.get(i).getContents().equals(Content)) {
    //             return true;
    //         }
    //     }
    //     return false;
    // }

    // /**
    //  * 정렬 기능
    //  */
    // private void sort() {
    //     String sort = (String) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.KBUCKET_SORT_KEY, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //     KLog.d(TAG, "@@ Sort : " + sort);
    //     if (sort == null) {
    //         mListAdapter.setDataList(mDataList);
    //         return;
    //     }
    //     if (sort.equals(ContextUtils.SORT_DATE)) {
    //         KLog.d(TAG, "@@ Sort 1: " + sort);
    //         Collections.sort(mBucketDataList, KBucketSort.DATE_SORT);
    //     } else if (sort.equals(ContextUtils.SORT_MEMO)) {
    //         KLog.d(TAG, "@@ Sort 2: " + sort);
    //         Collections.sort(mBucketDataList, KBucketSort.MEMO_SORT);
    //     } else {
    //         KLog.d(TAG, "@@ Sort 3: " + sort);
    //         Collections.sort(mBucketDataList, KBucketSort.DEADLINE_SORT);
    //     }

    //     mDataList.clear();
    //     for (int i = 0; i < mBucketDataList.size(); i++) {
    //         PostData data = mBucketDataList.get(i);
    //         if (data.getCompleteYN().equals("Y")) {
    //             continue;
    //         }
    //         mDataList.add(data.getContents());
    //     }
    //     if (sort.equals(ContextUtils.SORT_DATE)) {

    //         Collections.reverse(mDataList);
    //     }
    //     mListAdapter.setDataList(mDataList);
    // }

    // @Override
    // protected void onStop() {
    //     super.onStop();
    //     mDataList = null;
    //     mBucketDataList = null;
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
