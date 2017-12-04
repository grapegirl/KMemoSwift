//
//  BucketListView.swift
//  완료 가지 리스트 목록
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class BucketListView: UIViewController , IHttpReceive {

    private let TAG : String = "BucketListView"

    private let TOAST_MASSEGE : Int                = 10
    private let UPLOAD_IMAGE : Int                 = 20
    private let UPLOAD_BUCKET : Int                = 30
    private let SELECT_BUCKET_CATEGORY : Int       = 40

    private var mDataList = Array<PostData>()
    private var mSqlQuery  : SQLQuery? = nil

    private var mShareIdx : Int = -1
    private var mImageIdx : Int = -1
    private var mCategory : Int = 1

    // private ListView mListView = null;
    // private CardViewListAdpater mListAdapter = null;
    // private ConfirmPopup mConfirmPopup = null;
    // private SpinnerListPopup mCategoryPopup = null;

    override func viewDidLoad() {
        super.viewDidLoad()
        KLog.d(tag: TAG, msg: "viewDidLoad")
        initialize()
    }
    
    func initialize(){
    //     mListView = (ListView) findViewById(R.id.bucket_list_listview);
           mSqlQuery = SQLQuery()
           setListData()
    //     Collections.reverse(mDataList);
    //     mListAdapter = new CardViewListAdpater(this, R.layout.cardview_list_line, mDataList, this, this);
    //     mListView.setAdapter(mListAdapter);
    //     AppUtils.sendTrackerScreen(this, "완료가지화면");
    }

    func finish(){
            KLog.d(tag: TAG, msg: "finish")
            deleteImageResource()
            let uvc = self.storyboard?.instantiateViewController(withIdentifier: ContextUtils.MAIN_VIEW)
            uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
            present(uvc!, animated: true, completion: nil)
    }
   
    /**
     * DB 데이타 불러와서 데이타 표시하기
     */
    private func setListData() {
         if(mSqlQuery != nil){
            var bucketList : Results<Bucket>? = nil

            bucketList = mSqlQuery?.selectKbucket()

            let strCount = String(describing: bucketList?.count)
            KLog.d(tag: TAG, msg: "realm DB count : " + strCount)
            for kbucket in bucketList!
            {
                KLog.d(tag: TAG, msg: "realm DB data : " + kbucket.mContent)
                if  (kbucket.mCompleteYN != nil && kbucket.mCompleteYN == "N") {
                    continue
                }
                var postData = PostData()
                postData.m_contents = kbucket.mContent
                postData.m_date = kbucket.mCompleteDate
                postData.mImageName = kbucket.mImageURl
                postData.mCompleteYN = kbucket.mCompleteYN
                mDataList.append(postData)
            }
        }
    }

   @IBAction func onClick(_ sender: Any) {
        switch(sender  as! UIButton ){
            let index = 0
            let uvc = self.storyboard?.instantiateViewController(withIdentifier: "WriteDetailView")
            uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
            uvc?.CONTENTS = mDataList[index].mContent
            uvc?.BACK = ContextUtils.VIEW_COMPLETE_LIST
            present(uvc!, animated: true, completion: nil)

            finish()
        }
    }

    // @Override
    // public boolean onLongClick(View v) {
    //     mShareIdx = v.getId();
    //     String memo = mDataList.get(mShareIdx).getContents();

    //     String title = getString(R.string.share_popup_title);
    //     String content = getString(R.string.share_popup_content);
    //     mConfirmPopup = new ConfirmPopup(this, title, ": " + memo + "\n\n " + content, R.layout.popup_confirm, this, OnPopupEventListener.POPUP_BUCKET_SHARE);
    //     mConfirmPopup.showDialog();
    //     return true;
    // }

    // @Override
    // public void onPopupAction(int popId, int what, Object obj) {
    //     if (popId == OnPopupEventListener.POPUP_BUCKET_SHARE) {
    //         if (what == POPUP_BTN_OK) {
    //             mHandler.sendEmptyMessage(SELECT_BUCKET_CATEGORY);
    //         }
    //         mConfirmPopup.closeDialog();
    //     } else if (popId == OnPopupEventListener.POPUP_BUCKET_CATEGORY) {
    //         if (what == POPUP_BTN_OK) {
    //             JSONObject json = (JSONObject) obj;
    //             try {
    //                 mCategory = Integer.valueOf(json.getString("styleCode"));
    //             } catch (JSONException e) {
    //                 mCategory = 1;
    //             }
    //             Log.d(TAG, "@@ mCategory : " + mCategory);
    //             mHandler.sendEmptyMessage(UPLOAD_BUCKET);
    //         }
    //         mCategoryPopup.closeDialog();
    //     }
    // }

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

         if (actionId == ConstHTTP.INSERT_BUCKET) {
            if (type == ConstHTTP.HTTP_FAIL) {
                var message = AppUtils.localizedString(forKey : "write_bucekt_fail_string")
                handleMessage(what: TOAST_MASSEGE, obj: message)
            } else {
                do {
                    if let jsonString = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        isValid = jsonString["isValid"] as! Bool
                        mImageIdx = jsonString["idx"] as! Int
                    }

                    if (isValid == true) {
                        // 이미지가 있는 경우 전송함
                        if (mDataList[mShareIdx].mImageName != nil && mDataList[mShareIdx].mImageName.count > 0) {
                            handleMessage(what: UPLOAD_IMAGE, obj: "")
                        } else {
                            var message = AppUtils.localizedString(forKey : "write_bucekt_success_string")
                            handleMessage(what: TOAST_MASSEGE, obj: message)
                        }
                    }
                } catch  {
                        KLog.d(tag : TAG, msg : "@@ jsonException message ");
                        handleMessage(what: SERVER_LOADING_FAIL, obj: "")
                }
            }
        }// 이미지 업로드 결과
        else if (actionId == ConstHTTP.INSERT_IMAGE) {
            if (type == IHttpReceive.HTTP_FAIL) {
                var message = AppUtils.localizedString(forKey : "upload_image_fail_string")
                handleMessage(what: TOAST_MASSEGE, obj: message)
            } else {
                if (isValid == true) {
                    var message = AppUtils.localizedString(forKey : "write_bucekt_success_string")
                    handleMessage(what: TOAST_MASSEGE, obj: message)
                }
            }
        }
    }

    // /**
    //  * 서버로 전송할 데이타 만들기
    //  *
    //  * @return 전송 데이타
    //  */
    // private HashMap<String, Object> shareBucket() {
    //     Bucket bucket = new Bucket();
    //     bucket.setCategoryCode(1);
    //     String userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //     bucket.setNickName(userNickName);
    //     bucket.setContent(mDataList.get(mShareIdx).getContents());
    //     bucket.setImageUrl("");
    //     bucket.setDate(mDataList.get(mShareIdx).getDate());
    //     return bucket.toHasnMap();
    // }

    // /**
    //  * 서버로 전송할 데이타 만들기
    //  *
    //  * @return 전송 데이타
    //  */
    // private HashMap<String, Object> shareBucketImage() {
    //     Bucket bucket = new Bucket();
    //     String userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //     bucket.setNickName(userNickName);
    //     bucket.setContent(mDataList.get(mShareIdx).getContents());
    //     bucket.setImageUrl("");
    //     bucket.setDate(mDataList.get(mShareIdx).getDate());
    //     bucket.setCategoryCode(mCategory);
    //     return bucket.toHasnMap();
    // }

    func handleMessage(what : Int, obj : String) {
        switch (what) {
            case TOAST_MASSEGE:
                Toast.showToast(message: obj)
                break;
            case UPLOAD_IMAGE:
    //             String photoPath = mDataList.get(mShareIdx).getImageName();
    //             KLog.d(TAG, "@@ UPLOAD IMAGE 전송 시작 !");
    //             if (photoPath != null && !photoPath.equals("")) {
    //                 Bitmap bitmap = ByteUtils.getFileBitmap(photoPath);
    //                 Calendar calendar = Calendar.getInstance();
    //                 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_hhmmss");
    //                 String fileName = sdf.format(calendar.getTime());

    //                 byte[] bytes = ByteUtils.getByteArrayFromBitmap(bitmap);
    //                 HttpUrlFileUploadManager httpUrlFileUploadManager = new HttpUrlFileUploadManager(ContextUtils.KBUCKET_UPLOAD_IMAGE_URL, this, IHttpReceive.INSERT_IMAGE, bytes);
    //                 httpUrlFileUploadManager.execute(photoPath, "idx", mImageIdx + "", fileName + ".jpg");
    //             } else {
    //                 KLog.d(TAG, "@@ UPLOAD IMAGE NO !");
    //             }
                break;
            case UPLOAD_BUCKET:
                let url  = ContextUtils.KBUCKET_INSERT_BUCKET_URL
                let  httpUrlTaskManager : HttpUrlTaskManager =  HttpUrlTaskManager(url : url, post : true, receive : self, id : ConstHTTP.INSERT_BUCKET);
                httpUrlTaskManager.actionTask()
                break;
            case SELECT_BUCKET_CATEGORY:
                let title = AppUtils.localizedString(forKey : "category_popup_title")
                let content = AppUtils.localizedString(forKey : "category_popup_content")
                  
                var list = Array<Category>()
                list.append(Category(name : "LIEF", code: 1))
                list.append(Category(name : "LOVE", code : 2))
                list.append(Category(name : "WORK", code : 3))
                list.append(Category(name : "EDUCATION", code : 4))
                list.append(Category(name : "FAMILY", code : 5))
                list.append(Category(name : "FINANCE", code : 6))
                list.append(Category(name : "DEVELOP", code : 7))
                list.append(Category(name : "HEALTH", code : 8))
                list.append(Category(name : "ETC", code : 9))
    
    //           mCategoryPopup = new SpinnerListPopup(this, title, "", list, R.layout.popupview_spinner_list, this, OnPopupEventListener.POPUP_BUCKET_CATEGORY);
    //           mCategoryPopup.showDialog();
                break;
        }
    }
}
