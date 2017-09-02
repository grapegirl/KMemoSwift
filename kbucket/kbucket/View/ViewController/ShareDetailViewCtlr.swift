////
////  ShareDetailViewCtlr.swift
////  공유 싱세 화면
////
////  Created by grapegirl on 2017. 9. 01..
////  Copyright © 2017년 kikiplus. All rights reserved.
////
//
//import UIKit
//
//
//class ShareListViewCtlr : UIViewController {
//
//    private let TAG : String = "ShareListViewCtlr"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        KLog.d(tag: TAG, msg: "viewDidLoad");
//    }
//
//    // private final String TAG = this.getClass().getSimpleName();
//    // private android.os.Handler mHandler = null;
//    // private ArrayList<Comment> mCommentList = null;
//    // private CommentListAdpater mListAdapter = null;
//    // private ListView mListView = null;
//
//    // private int mBucketNo = -1;
//    // private Bucket mBucket;
//    // private String mUserNickname = null;
//    // private String mDetailImageFileName = null;
//
//    // private final int TOAST_MASSEGE = 10;
//    // private final int DOWNLOAD_IMAGE = 20;
//    // private final int LOAD_COMMENT_LIST = 30;
//    // private final int SERVER_LOADING_FAIL = 40;
//    // private final int SET_COMMENT_LIST = 50;
//    // private final int SET_IMAGE = 60;
//
//    // private SQLQuery mSqlQuery = null;
//    // private ConfirmPopup mConfirmPopup = null;
//
//    // @Override
//    // protected void onCreate(Bundle savedInstanceState) {
//    //     super.onCreate(savedInstanceState);
//    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
//    //     setContentView(R.layout.share_detail_activity);
//    //     setBackgroundColor();
//
//    //     mHandler = new Handler(this);
//    //     mCommentList = new ArrayList<Comment>();
//    //     mSqlQuery = new SQLQuery();
//    //     Intent Intent = getIntent();
//    //     String idx = Intent.getStringExtra(ContextUtils.NUM_SHARE_BUCKET_IDX);
//    //     mBucket = (Bucket) Intent.getSerializableExtra(ContextUtils.OBJ_SHARE_BUCKET);
//
//    //     mUserNickname = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
//    //     mHandler.sendMessage(mHandler.obtainMessage(LOAD_COMMENT_LIST, idx));
//
//    //     ((Button) findViewById(R.id.comment_layout_sendBtn)).setOnClickListener(this);
//    //     ((Button) findViewById(R.id.share_add)).setOnClickListener(this);
//    //     ((ImageView) findViewById(R.id.share_contents_imageview)).setOnClickListener(this);
//    //     setData(mBucket);
//    //     AppUtils.sendTrackerScreen(this, "모두가지상세화면");
//    // }
//
//    // private void setBackgroundColor() {
//    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
//    //     if (color != -1) {
//    //         findViewById(R.id.bucketdetail_back_color).setBackgroundColor(color);
//    //     }
//    // }
//
//    // @Override
//    // public void finish() {
//    //     super.finish();
//    //     this.overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
//    // }
//
//    // @Override
//    // protected void onDestroy() {
//    //     super.onDestroy();
//    //     deleteImageResource();
//    // }
//
//    // /**
//    //  * 데이타 초기화
//    //  */
//    // private void setData(Bucket bucket) {
//    //     mBucketNo = bucket.getIdx();
//    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
//    //     ((Button) findViewById(R.id.share_detail_text)).setTypeface(typeFace);
//    //     ((TextView) findViewById(R.id.share_title_textview)).setTypeface(typeFace);
//    //     ((TextView) findViewById(R.id.share_contents_textview)).setTypeface(typeFace);
//    //     ((TextView) findViewById(R.id.share_title_textview)).setText(bucket.getDate());
//    //     ((TextView) findViewById(R.id.share_contents_textview)).setText(bucket.getContent());
//    //     ((Button) findViewById(R.id.share_add)).setTypeface(typeFace);
//
//    //     KLog.d(TAG, "@@ image exists : " + bucket.getImageUrl());
//    //     if (bucket.getImageUrl() != null && !bucket.getImageUrl().equals("N")) {
//    //         mHandler.sendEmptyMessage(DOWNLOAD_IMAGE);
//    //     }
//    // }
//
//    // @Override
//    // public void onHttpReceive(int type, int actionId, Object obj) {
//    //     KLog.d(this.getClass().getSimpleName(), "@@ onHttpReceive actionId: " + actionId);
//    //     KLog.d(this.getClass().getSimpleName(), "@@ onHttpReceive  type: " + type);
//    //     KLog.d(this.getClass().getSimpleName(), "@@ onHttpReceive  obj: " + obj);
//    //     String mData = (String) obj;
//    //     boolean isValid = false;
//    //     if (actionId != IHttpReceive.DOWNLOAD_IMAGE && mData != null) {
//    //         try {
//    //             JSONObject json = new JSONObject(mData);
//    //             isValid = json.getBoolean("isValid");
//    //         } catch (JSONException e) {
//    //             KLog.e(TAG, "@@ jsonException message : " + e.getMessage());
//    //         }
//    //     }
//    //     if (actionId == IHttpReceive.COMMENT_LIST) {
//    //         KProgressDialog.setDataLoadingDialog(this, false, null, false);
//    //         if (type == IHttpReceive.HTTP_OK && isValid == true) {
//    //             try {
//    //                 JSONObject json = new JSONObject(mData);
//    //                 JSONArray jsonArray = json.getJSONArray("CommentVOList");
//    //                 KLog.d(this.getClass().getSimpleName(), "@@ jsonArray :   " + jsonArray);
//    //                 int size = jsonArray.length();
//    //                 mCommentList.clear();
//    //                 for (int i = 0; i < size; i++) {
//    //                     JSONObject jsonObject = (JSONObject) jsonArray.get(i);
//    //                     Comment comment = new Comment();
//    //                     comment.setNickName(jsonObject.getString("nickName"));
//    //                     comment.setDate(jsonObject.getString("createDt"));
//    //                     comment.setContent(jsonObject.getString("content"));
//    //                     mCommentList.add(comment);
//    //                 }
//    //                 if (mCommentList != null && mCommentList.size() > 0) {
//    //                     realmMgr realmMgr = new realmMgr();
//    //                     realmMgr.updateBucketComment(mCommentList, mBucketNo);
//    //                 }
//    //                 mHandler.sendEmptyMessage(SET_COMMENT_LIST);
//    //             } catch (Exception e) {
//    //                 KLog.e(TAG, "@@ jsonException message : " + e.getMessage());
//    //                 mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
//    //             }
//    //         } else {
//    //             RealmResults<Comment> infoList = realmMgr.selectBucketCommentList(mBucketNo);
//    //             if (infoList != null) {
//    //                 mCommentList.clear();
//    //                 for (int i = 0; i < infoList.size(); i++) {
//    //                     mCommentList.add(infoList.get(i));
//    //                 }
//    //                 mHandler.sendEmptyMessage(SET_COMMENT_LIST);
//    //             } else {
//    //                 mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
//    //             }
//    //         }
//    //     } else if (actionId == INSERT_COMMENT) {
//    //         KProgressDialog.setDataLoadingDialog(this, false, null, false);
//    //         if (type == IHttpReceive.HTTP_OK && isValid == true) {
//    //             mHandler.sendMessage(mHandler.obtainMessage(LOAD_COMMENT_LIST, mBucketNo));
//    //         } else {
//    //             mHandler.sendEmptyMessage(SERVER_LOADING_FAIL);
//    //         }
//    //     } else if (actionId == IHttpReceive.DOWNLOAD_IMAGE) {
//    //         if (type == IHttpReceive.HTTP_OK) {
//    //             KLog.d(TAG, "downlaod image " + obj);
//    //             mHandler.sendEmptyMessage(SET_IMAGE);
//    //         }
//    //     }
//    // }
//
//    // @Override
//    // public void onClick(View v) {
//    //     switch (v.getId()) {
//    //         case R.id.comment_layout_sendBtn:
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
//    //     }
//    // }
//
//    // @Override
//    // public boolean handleMessage(Message msg) {
//    //     switch (msg.what) {
//    //         case DOWNLOAD_IMAGE:
//    //             String url = ContextUtils.KBUCKET_DOWNLOAD_IAMGE + "?idx=" + mBucketNo;
//    //             KLog.d(TAG, "@@ download image url : " + url);
//    //             HttpUrlFileDownloadManager urlTaskManager = new HttpUrlFileDownloadManager(url, this, IHttpReceive.DOWNLOAD_IMAGE);
//    //             mDetailImageFileName = DataUtils.getNewFileName();
//    //             urlTaskManager.execute(mDetailImageFileName);
//    //             findViewById(R.id.share_contents_loadingbar).setVisibility(View.VISIBLE);
//    //             break;
//    //         case LOAD_COMMENT_LIST:
//    //             //KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string));
//    //             HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_COMMENT_URL, true, this, IHttpReceive.COMMENT_LIST);
//    //             HashMap<String, Object> map = new HashMap<String, Object>();
//    //             map.put("idx", mBucketNo);
//    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
//    //             break;
//    //         case SET_COMMENT_LIST:
//    //             mListView = (ListView) findViewById(R.id.share_comment_listview);
//    //             mListAdapter = new CommentListAdpater(this, R.layout.comment_list_line, mCommentList, this);
//    //             mListView.setAdapter(mListAdapter);
//    //             break;
//    //         case TOAST_MASSEGE:
//    //             Toast.makeText(getApplicationContext(), (String) msg.obj, Toast.LENGTH_LONG).show();
//    //             break;
//    //         case SERVER_LOADING_FAIL:
//    //             KLog.d(TAG, "@@ SERVER_LOADING_FAIL");
//    //             String message = getString(R.string.server_fail_string);
//    //             mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
//    //             finish();
//    //             break;
//    //         case SET_IMAGE:
//    //             findViewById(R.id.share_contents_loadingbar).setVisibility(View.INVISIBLE);
//    //             try {
//    //                 //Bitmap bitmap = BitmapFactory.decodeFile(mDetailImageFileName);
//    //                 BitmapFactory.Options options = new BitmapFactory.Options();
//    //                 options.outWidth = 150;
//    //                 options.outHeight = 150;
//    //                 Bitmap bitmap = BitmapFactory.decodeFile(mDetailImageFileName, options);
//    //                 ((ImageView) findViewById(R.id.share_contents_imageview)).setScaleType(ImageView.ScaleType.FIT_XY);
//    //                 ((ImageView) findViewById(R.id.share_contents_imageview)).setImageBitmap(bitmap);
//    //             } catch (Exception e) {
//    //                 e.printStackTrace();
//    //                 KLog.d(TAG, "@@ set image : " + e.toString());
//    //             }
//    //             break;
//    //     }
//    //     return false;
//    // }
//
//    // /**
//    //  * 이미지 리소스 해제하기
//    //  */
//    // private void deleteImageResource() {
//    //     if (mBucket.getImageUrl() != null && !mBucket.getImageUrl().equals("N")) {
//    //         DataUtils.deleteFile(mDetailImageFileName);
//    //     }
//    //     ((ImageView) findViewById(R.id.share_contents_imageview)).setImageBitmap(null);
//    // }
//
//    // @Override
//    // public void onPopupAction(int popId, int what, Object obj) {
//    //     if (popId == OnPopupEventListener.POPUP_BUCKET_ADD) {
//    //         if (what == POPUP_BTN_OK) {
//    //             String contents = ((TextView) findViewById(R.id.share_contents_textview)).getText().toString();
//    //             boolean inContainsBucket = mSqlQuery.containsKbucket(getApplicationContext(), contents);
//    //             if (!inContainsBucket) {
//    //                 Date dateTime = new Date();
//    //                 String date = DateUtils.getStringDateFormat(DateUtils.DATE_YYMMDD_PATTER, dateTime);
//    //                 mSqlQuery.insertUserSetting(getApplicationContext(), contents, date, "N", "");
//    //                 realmMgr.insertPostData(new PostData(contents, date));
//
//    //                 mConfirmPopup.closeDialog();
//
//    //                 String message = getString(R.string.share_add_popup_ok);
//    //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
//    //             } else {
//    //                 String message = getString(R.string.check_input_bucket_string);
//    //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
//    //             }
//    //         } else {
//    //             mConfirmPopup.closeDialog();
//    //         }
//    //     }
//    // }
//}
