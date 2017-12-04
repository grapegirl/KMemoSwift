//
//  ShareDetailView.swift
//  공유 싱세 화면
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class ShareDetailView : UIViewController , IHttpReceive {

    private let TAG : String = "ShareDetailView"
   
    private let TOAST_MASSEGE : Int             = 10
    private let DOWNLOAD_IMAGE : Int            = 20
    private let LOAD_COMMENT_LIST : Int         = 30
    private let SERVER_LOADING_FAIL : Int       = 40
    private let SET_COMMENT_LIST : Int          = 50
    private let SET_IMAGE : Int                 = 60
   
    private var mCommentList = Array<Comment>()

    public var mUserNickname :  String = ""
    public var mDetailImageFileName :  String = ""

    private var mSqlQuery : SQLQuery? = nil
    private var mBucketNo : Int = -1
    public var mBucket  : Bucket 

   // private CommentListAdpater mListAdapter = null;
   // private ListView mListView = null;
   // private ConfirmPopup mConfirmPopup = null;

   override func viewDidLoad() {
       super.viewDidLoad()
       // Do any additional setup after loading the view, typically from a nib.
       KLog.d(tag: TAG, msg: "viewDidLoad");
       initialize()
   }

    func initialize(){
        mBucketDataList = Array<PostData>()
        mSqlQuery = SQLQuery()
//    //     Intent Intent = getIntent();
//    //     String idx = Intent.getStringExtra(ContextUtils.NUM_SHARE_BUCKET_IDX);
//    //     mBucket = (Bucket) Intent.getSerializableExtra(ContextUtils.OBJ_SHARE_BUCKET);
//    //     mUserNickname = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
//    //     mHandler.sendMessage(mHandler.obtainMessage(LOAD_COMMENT_LIST, idx));
//    //     ((Button) findViewById(R.id.comment_layout_sendBtn)).setOnClickListener(this);
//    //     ((Button) findViewById(R.id.share_add)).setOnClickListener(this);
//    //     ((ImageView) findViewById(R.id.share_contents_imageview)).setOnClickListener(this);
        setData(bucket : mBucket)
        //AppUtils.sendTrackerScreen(this, "모두가지상세화면");
    }

   /**
    * 데이타 초기화
    */
   func setData( bucket : Bucket) {
       mBucketNo = bucket.getIdx()
       KLog.d(tag : TAG, msg : "@@ image exists  type: " + bucket.getImageUrl());

       if (bucket.getImageUrl() != nil && !bucket.getImageUrl().equals("N")) {
           handleMessage(what: DOWNLOAD_IMAGE, obj: "")
       }
   }

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

        if (actionId == ConstHTTP.COMMENT_LIST) {
            //  KProgressDialog.setDataLoadingDialog(this, false, null, false);
           if (type == ConstHTTP.HTTP_OK && isValid == true) {
                do {
                      if let jsonString = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            let List : NSArray = jsonString["CommentVOList"] as! NSArray
                            let size : Int = List.count
                            if size > 0 {
                            mCommentList.removeAll()
                            for index in 0...size-1  {
                                let aObject = List[index] as! [String : AnyObject]
                                let comment : Comment = Comment()
                                comment.mCategoryCode = aObject["nickName"] as! String
                                comment.mCategoryName = aObject["createDt"] as! String
                                comment.mCategoryName = aObject["content"] as! String
                                mCommentList.append(comment)
                             }
                      	  }
                    }
                    handleMessage(what: SET_COMMENT_LIST, obj: "")
                } catch {
                    KLog.d(tag : TAG, msg : "@@ Exception : " + error)
                    handleMessage(what: SERVER_LOADING_FAIL, obj: "")
                }
           } else {
                 handleMessage(what: SERVER_LOADING_FAIL, obj: "")
           }
        } else if (actionId == ConstHTTP.COMMENT_LIST) {
            //KProgressDialog.setDataLoadingDialog(this, false, null, false);
           if (type == ConstHTTP.HTTP_OK && isValid == true) {
                handleMessage(what: LOAD_COMMENT_LIST, obj: String(mBucketNo))
           } else {
               handleMessage(what: SERVER_LOADING_FAIL, obj: "")
           }
        } else if (actionId == ConstHTTP.DOWNLOAD_IMAGE) {
            if (type == ConstHTTP.HTTP_OK) {
               KLog.d(TAG, "downlaod image " + obj);
               handleMessage(what: SET_IMAGE, obj: "")
            }
        }
    }

        @IBAction func onClick(_ sender: Any) {
            switch(sender  as! UIButton ){
//         case R.id.comment_layout_sendBtn:
//    //             String text = ((EditText) findViewById(R.id.comment_layout_text)).getText().toString();
//    //             if (text.replaceAll(" ", "").equals("")) {
//    //                 break;
//    //             }
//    //             KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);
//    //             HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.INSERT_COMMENT_URL, true, this, IHttpReceive.INSERT_COMMENT);
//    //             HashMap<String, Object> map = new HashMap<String, Object>();
//    //             map.put("NICKNAME", mUserNickname);
//    //             map.put("CONTENT", text);
//    //             map.put("BUCKET_NO", mBucketNo + "");
//    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
//    //             ((EditText) findViewById(R.id.comment_layout_text)).setText("");
//    //             break;
//    //         case R.id.share_contents_imageview:
//    //             if (mDetailImageFileName != null) {
//    //                 ImagePopup popup = new ImagePopup(this, R.layout.popup_img, mDetailImageFileName, getWindow());
//    //                 popup.showDialog();
//    //             }
//    //             break;
//    //         case R.id.share_add:
//    //             String title = getString(R.string.share_add_popup_title);
//    //             String content = getString(R.string.share_add_popup_content);
//    //             mConfirmPopup = new ConfirmPopup(this, title, content, R.layout.popup_confirm, this, OnPopupEventListener.POPUP_BUCKET_ADD);
//    //             mConfirmPopup.showDialog();
//    //             break;
            default:
                break;
			}
        }

        func finish(){
            KLog.d(tag: TAG, msg: "finish")
            deleteImageResource()
            let uvc = self.storyboard?.instantiateViewController(withIdentifier: ContextUtils.MAIN_VIEW)
            uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
            present(uvc!, animated: true, completion: nil)
        }

        func handleMessage(what : Int, obj : String) {
            switch (what) {
                case TOAST_MASSEGE:
                    Toast.showToast(message: obj)
                    break;
                case DOWNLOAD_IMAGE:
                    // String url = ContextUtils.KBUCKET_DOWNLOAD_IAMGE + "?idx=" + mBucketNo;
                    // KLog.d(TAG, "@@ download image url : " + url);
                    // HttpUrlFileDownloadManager urlTaskManager = new HttpUrlFileDownloadManager(url, this, IHttpReceive.DOWNLOAD_IMAGE);
                    // mDetailImageFileName = DataUtils.getNewFileName();
                    // urlTaskManager.execute(mDetailImageFileName);
                    // findViewById(R.id.share_contents_loadingbar).setVisibility(View.VISIBLE);
                    break;
                case LOAD_COMMENT_LIST:
                    //KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string));
                    // HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_COMMENT_URL, true, this, IHttpReceive.COMMENT_LIST);
                    // HashMap<String, Object> map = new HashMap<String, Object>();
                    // map.put("idx", mBucketNo);
                    // httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
                    break;
                case SET_COMMENT_LIST:
                    // mListView = (ListView) findViewById(R.id.share_comment_listview);
                    // mListAdapter = new CommentListAdpater(this, R.layout.comment_list_line, mCommentList, this);
                    // mListView.setAdapter(mListAdapter);
                    break;
                case SERVER_LOADING_FAIL:
                    var message = AppUtils.localizedString(forKey : "server_fail_string")
                    handleMessage(what: TOAST_MASSEGE, obj: message)
                    finish()
                    break;
                case SET_IMAGE:
                    // findViewById(R.id.share_contents_loadingbar).setVisibility(View.INVISIBLE);
                    // try {
                    //     //Bitmap bitmap = BitmapFactory.decodeFile(mDetailImageFileName);
                    //     BitmapFactory.Options options = new BitmapFactory.Options();
                    //     options.outWidth = 150;
                    //     options.outHeight = 150;
                    //     Bitmap bitmap = BitmapFactory.decodeFile(mDetailImageFileName, options);
                    //     ((ImageView) findViewById(R.id.share_contents_imageview)).setScaleType(ImageView.ScaleType.FIT_XY);
                    //     ((ImageView) findViewById(R.id.share_contents_imageview)).setImageBitmap(bitmap);
                    // } catch (Exception e) {
                    //     e.printStackTrace();
                    //     KLog.d(TAG, "@@ set image : " + e.toString());
                    // }
                    break;
                }
        }
            
   /**
    * 이미지 리소스 해제하기
    */
   private func deleteImageResource() {
       if (mBucket.getImageUrl() != nil && !mBucket.getImageUrl().equals("N")) {
        //   DataUtils.deleteFile(mDetailImageFileName);
       }
       //((ImageView) findViewById(R.id.share_contents_imageview)).setImageBitmap(null);
   }

   // @Override
   // public void onPopupAction(int popId, int what, Object obj) {
   //     if (popId == OnPopupEventListener.POPUP_BUCKET_ADD) {
   //         if (what == POPUP_BTN_OK) {
   //             String contents = ((TextView) findViewById(R.id.share_contents_textview)).getText().toString();
   //             boolean inContainsBucket = mSqlQuery.containsKbucket(getApplicationContext(), contents);
   //             if (!inContainsBucket) {
   //                 Date dateTime = new Date();
   //                 String date = DateUtils.getStringDateFormat(DateUtils.DATE_YYMMDD_PATTER, dateTime);
   //                 mSqlQuery.insertUserSetting(getApplicationContext(), contents, date, "N", "");
   //                 realmMgr.insertPostData(new PostData(contents, date));

   //                 mConfirmPopup.closeDialog();

   //                 String message = getString(R.string.share_add_popup_ok);
   //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
   //             } else {
   //                 String message = getString(R.string.check_input_bucket_string);
   //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
   //             }
   //         } else {
   //             mConfirmPopup.closeDialog();
   //         }
   //     }
   // }
}
