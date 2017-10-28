//
//  WriteViewCtlr.swift
//  kbucket
//
//  Created by 김미혜 on 2017. 8. 20..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class WriteViewCtrl : UIViewController,  UITableViewDelegate, UITableViewDataSource, EventProtocol {
    
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
    private var mSqlQuery  : SQLQuery? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KLog.d(tag: TAG, msg: "viewDidLoad");
        
        mTableView.delegate = self
        mTableView.dataSource = self
        
        initialize()
    }
    
    func initialize()
    {
        mSqlQuery = SQLQuery()
        if(mSqlQuery != nil){
            var bucketList : Results<Bucket>? = nil

            bucketList = mSqlQuery?.selectKbucket()

            let strCount = String(describing: bucketList?.count)
            KLog.d(tag: TAG, msg: "realm DB count : " + strCount)
            for kbucket in bucketList!
            {
                KLog.d(tag: TAG, msg: "realm DB data : " + kbucket.mContent)
                if  (kbucket.mContent != nil && kbucket.mContent == "Y") {
                    continue
                }
                mDataList.append(kbucket.mContent)
            }

        }
        sort()
        print("@@ 디렉토리 : " + NSHomeDirectory())
    }
    
    /**
     * 정렬 기능
     */
    func sort() {
        let strSort = UserDefault.read(key: ContextUtils.KBUCKET_SORT_KEY)
        KLog.d(tag : TAG, msg: "Sort : " + strSort);
        if (strSort == nil) {
            self.mTableView.reloadData()
            return
        }
        
        if (strSort == (ContextUtils.SORT_DATE)) {
            mDataList.sort(){$0 < $1}
        } else if (strSort == (ContextUtils.SORT_MEMO)) {
            mDataList.sort(){$0 < $1}
        } else {
            mDataList.sort(){$0 > $1}
        }
        
        print(mDataList)
        self.mTableView.reloadData()
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
                
            }
            self.mTableView.reloadData()
            etEdit.text = ""
        }else if((sender as! UIButton) == btSortLastest){
            KLog.d(tag: TAG, msg: "onClick btSortLastest");
            UserDefault.write(key: ContextUtils.KBUCKET_SORT_KEY, value: ContextUtils.SORT_DATE)
            sort()
        }else if((sender as! UIButton) == btSortName){
            KLog.d(tag: TAG, msg: "onClick btSortName");
            UserDefault.write(key: ContextUtils.KBUCKET_SORT_KEY, value: ContextUtils.SORT_MEMO)
            sort()
        }else if((sender as! UIButton) == btSortDeadLine){
            KLog.d(tag: TAG, msg: "onClick btSortDeadLine");
            UserDefault.write(key: ContextUtils.KBUCKET_SORT_KEY, value: ContextUtils.SORT_DEADLINE)
            sort()
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mTableView.dequeueReusableCell(withIdentifier: "FirstCustomCell", for: indexPath) as! FirstCustomCell
        cell.btEdt.text = mDataList[indexPath.row]
        cell.mData = String(indexPath.row)
        cell.selectionStyle = .none
        
        cell.setOnEventListener(listenr: self)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        KLog.d(tag: TAG, msg: "row: \(indexPath.row)")
    }
    
    func receiveEventFromViewItem(gbn : Int, data : String) {
        KLog.d(tag: TAG, msg: "receiveEventFromViewItem data : " + data)
        switch(gbn){
        case 0://수정
            //index = Integer.valueOf((String) v.getTag());
            //             Intent intent = new Intent(this, WriteDetailActivity.class);
            //             intent.putExtra("CONTENTS", mDataList.get(index));
            //             intent.putExtra("BACK", ContextUtils.VIEW_WRITE);
            //             startActivity(intent);
            //             finish();
            
            break;
        case 1://삭제
            let index:Int? = Int(data)
            if (index! > 0 && index! < mDataList.count){
                let deleteItem : String
                deleteItem = mDataList[index!]
                let result : Bool
                result = removeDBData(Content: deleteItem)
                if(result){
                    mDataList.remove(at: index!)
                    self.mTableView.reloadData()
                    
                }
                
            }
            break;
        default:
            break;
        }
    }
    
    /**
     * DB 데이타 동기화하기(삭제)
     */
    func removeDBData( Content : String) -> Bool{
        KLog.d(tag: TAG, msg: "@@ remove Data Contents : " + Content);
        if(mSqlQuery != nil){
            return (mSqlQuery?.deleteUserBucket(contents: Content))!
        }
        return false
    }
}
