//
//  BucketListViewCtlr.swift
//  완료 가지 리스트 목록
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class BucketListViewCtlr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "BucketListViewCtlr", msg: "viewDidLoad");
    }
    

    // private final String TAG = this.getClass().getSimpleName();

    // private ArrayList<PostData> mDataList = null;
    // private ListView mListView = null;
    // private CardViewListAdpater mListAdapter = null;
    // private SQLQuery mSqlQuery = null;

    // private ConfirmPopup mConfirmPopup = null;
    // private SpinnerListPopup mCategoryPopup = null;

    // private int mShareIdx = -1;
    // private int mImageIdx = -1;
    // private int mCategory = 1;

    // private android.os.Handler mHandler = null;
    // private final int TOAST_MASSEGE = 10;
    // private final int UPLOAD_IMAGE = 20;
    // private final int UPLOAD_BUCKET = 30;
    // private final int SELECT_BUCKET_CATEGORY = 40;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.bucket_list_activity);
    //     setBackgroundColor();
    //     setTextPont();

    //     mHandler = new android.os.Handler(this);
    //     mListView = (ListView) findViewById(R.id.bucket_list_listview);
    //     mDataList = new ArrayList<PostData>();
    //     mSqlQuery = new SQLQuery();
    //     setListData();
    //     Collections.reverse(mDataList);
    //     mListAdapter = new CardViewListAdpater(this, R.layout.cardview_list_line, mDataList, this, this);
    //     mListView.setAdapter(mListAdapter);
    //     AppUtils.sendTrackerScreen(this, "완료가지화면");
    // }

    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     KLog.d(TAG, "@@ color : " + color);
    //     if (color != -1) {
    //         findViewById(R.id.bucketlist_back_color).setBackgroundColor(color);
    //     }
    // }


    // @Override
    // public void finish() {
    //     super.finish();
    //     this.overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    // }

    // /**
    //  * DB 데이타 불러와서 데이타 표시하기
    //  */
    // private void setListData() {
    //     LinkedList<LinkedHashMap<String, String>> map = mSqlQuery.selectKbucket(getApplicationContext());
    //     if (map == null) {
    //         return;
    //     }
    //     for (int i = 0; i < map.size(); i++) {
    //         LinkedHashMap<String, String> memoMap = map.get(i);
    //         KLog.d(this.getClass().getSimpleName(), "@@ memoMap" + memoMap.toString());

    //         if (memoMap.get("complete_yn").equals("N")) {
    //             continue;
    //         }
    //         PostData postData = new PostData("", memoMap.get("contents"), memoMap.get("date"), i);
    //         postData.setImageName(memoMap.get("image_path"));
    //         postData.setCompleteYN(memoMap.get("complete_yn"));
    //         mDataList.add(postData);
    //     }
    // }

    // @Override
    // public void onClick(View v) {
    //     int index = v.getId();
    //     Intent intent = new Intent(this, WriteDetailActivity.class);
    //     intent.putExtra("CONTENTS", mDataList.get(index).getContents());
    //     intent.putExtra("BACK", ContextUtils.VIEW_COMPLETE_LIST);
    //     startActivity(intent);
    //     finish();
    // }

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

    // @Override
    // public void onHttpReceive(int type, int actionId, Object obj) {
    //     KLog.d(this.getClass().getSimpleName(), "@@ onHttpReceive : " + obj);
    //     KLog.d(this.getClass().getSimpleName(), "@@ onHttpReceive type : " + type);
    //     // 버킷 공유 결과
    //     String mData = (String) obj;
    //     boolean isValid = false;
    //     if (actionId == IHttpReceive.INSERT_BUCKET) {
    //         if (type == IHttpReceive.HTTP_FAIL) {
    //             String message = getString(R.string.write_bucekt_fail_string);
    //             mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
    //         } else {
    //             if (mData != null) {
    //                 try {
    //                     JSONObject json = new JSONObject(mData);
    //                     isValid = json.getBoolean("isValid");
    //                     mImageIdx = json.getInt("idx");
    //                 } catch (JSONException e) {
    //                     KLog.e(TAG, "@@ jsonException message : " + e.getMessage());
    //                 }

    //                 if (isValid == true) {
    //                     // 이미지가 있는 경우 전송함
    //                     if (mDataList.get(mShareIdx).getImageName() != null && !mDataList.get(mShareIdx).getImageName().equals("")) {
    //                         mHandler.sendEmptyMessage(UPLOAD_IMAGE);
    //                     } else {
    //                         String message = getString(R.string.write_bucekt_success_string);
    //                         mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
    //                     }
    //                 }
    //             }
    //         }
    //     }// 이미지 업로드 결과
    //     else if (actionId == IHttpReceive.INSERT_IMAGE) {
    //         if (type == IHttpReceive.HTTP_FAIL) {
    //             String message = getString(R.string.upload_image_fail_string);
    //             mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
    //         } else {
    //             if (mData != null) {
    //                 try {
    //                     JSONObject json = new JSONObject(mData);
    //                     isValid = json.getBoolean("isValid");
    //                 } catch (JSONException e) {
    //                     KLog.e(TAG, "@@ jsonException message : " + e.getMessage());
    //                 }
    //             }
    //             if (isValid == true) {
    //                 String message = getString(R.string.write_bucekt_success_string);
    //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, message));
    //             }
    //         }
    //     }
    // }

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

    // @Override
    // public boolean handleMessage(Message msg) {
    //     switch (msg.what) {
    //         case TOAST_MASSEGE:
    //             Toast.makeText(getApplicationContext(), (String) msg.obj, Toast.LENGTH_LONG).show();
    //             break;
    //         case UPLOAD_IMAGE:
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
    //             break;
    //         case UPLOAD_BUCKET:
    //             HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_INSERT_BUCKET_URL, true, this, IHttpReceive.INSERT_BUCKET);
    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(shareBucketImage()));
    //             break;
    //         case SELECT_BUCKET_CATEGORY:
    //             String title = getString(R.string.category_popup_title);
    //             String content = getString(R.string.category_popup_content);
    //             ArrayList<Category> list = new ArrayList<Category>();
    //             list.add(new Category("LIEF", 1));
    //             list.add(new Category("LOVE", 2));
    //             list.add(new Category("WORK", 3));
    //             list.add(new Category("EDUCATION", 4));
    //             list.add(new Category("FAMILY", 5));
    //             list.add(new Category("FINANCE", 6));
    //             list.add(new Category("DEVELOP", 7));
    //             list.add(new Category("HEALTH", 8));
    //             list.add(new Category("ETC", 9));
    //             mCategoryPopup = new SpinnerListPopup(this, title, "", list, R.layout.popupview_spinner_list, this, OnPopupEventListener.POPUP_BUCKET_CATEGORY);
    //             mCategoryPopup.showDialog();
    //             break;
    //     }
    //     return false;
    // }

    // private void setTextPont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((Button) findViewById(R.id.bucket_list_text)).setTypeface(typeFace);
    // }

}
