//
//  WriteDetailViewCtlr.swift
//  버킷 작성 클래스
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class WriteDetailViewCtlr: UIViewController {

    private let TAG : String = "WriteDetailViewCtlr"
    // private SQLQuery mSqlQuery = null;

    private var mContents : String
    private var mDate : String
    private var mDeadLineDate : String
    private var BACK : String
    private var mPhotoPath : String
    
    private var mImageIdx : Int = -1
    private var mCategory : Int = 1

    private let TOAST_MASSEGE : Int = 10
    private let UPLOAD_IMAGE : Int = 20
    private let UPLOAD_BUCKET : Int = 30
    private let SELECT_BUCKET_CATEGORY : Int = 40

    // private CheckBox mCheckbox = null;
    // /*카메라 호출 리턴값*/
    // private int REQ_CODE_PICKCUTRE = 1000;
    // /*갤러리 호출 리턴값*/
    // private int REQ_CODE_GALLERY = 1001;

    // private ImageView mImageView = null;
    // private ConfirmPopup mConfirmPopup = null;
    // private SpinnerListPopup mCategoryPopup = null;
    // private android.os.Handler mHandler = null;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: TAG, msg: "viewDidLoad");
    }

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.write_detail_activity);
    //     setBackgroundColor();
    //     setTextPont();
    //     ((Button) findViewById(R.id.write_saveButton)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.write_deleteButton)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.write_shareButton)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.write_image_camera)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.write_image_gallery)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.write_image_remove)).setOnClickListener(this);

    //     mHandler = new android.os.Handler(this);
    //     mSqlQuery = new SQLQuery();

    //     mCheckbox = (CheckBox) findViewById(R.id.write_layout_checkbox);
    //     mContents = getIntent().getStringExtra("CONTENTS");

    //     BACK = getIntent().getStringExtra("BACK");

    //     mImageView = (ImageView) findViewById(R.id.write_layout_imageview);

    //     setData();
    //     AppUtils.sendTrackerScreen(this, "가지상세화면");
    // }

    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.writedetail_back_color).setBackgroundColor(color);
    //     }
    // }

    // @Override
    // public void finish() {
    //     super.finish();
    //     this.overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    // }

    // @Override
    // public void onBackPressed() {
    //     if (BACK.equals(ContextUtils.VIEW_COMPLETE_LIST)) {
    //         Intent intent = new Intent(this, BucketListActivity.class);
    //         startActivity(intent);
    //         finish();
    //     } else {
    //         Intent intent = new Intent(this, WriteActivity.class);
    //         startActivity(intent);
    //         finish();
    //     }

    // }

    // @Override
    // public void onClick(View v) {
    //     switch (v.getId()) {
    //         // 저장 버튼
    //         case R.id.write_saveButton:
    //             updateDBDate();
    //             onBackPressed();
    //             break;
    //         // 삭제 버튼
    //         case R.id.write_deleteButton:
    //             String title = getString(R.string.delete_popup_title);
    //             String content = getString(R.string.delete_popup_content);
    //             mConfirmPopup = new ConfirmPopup(this, title, ": " + mContents + "\n\n " + content, R.layout.popup_confirm, this, OnPopupEventListener.POPUP_BUCKET_DELETE);
    //             mConfirmPopup.showDialog();
    //             break;
    //         // 공유 버튼
    //         case R.id.write_shareButton:
    //             title = getString(R.string.share_popup_title);
    //             content = getString(R.string.share_popup_content);
    //             mConfirmPopup = new ConfirmPopup(this, title, ": " + mContents + "\n\n " + content, R.layout.popup_confirm, this, OnPopupEventListener.POPUP_BUCKET_SHARE);
    //             mConfirmPopup.showDialog();
    //             break;
    //         //이미지 첨부(카메라로 가져오기)
    //         case R.id.write_image_camera:
    //             mPhotoPath = DataUtils.getNewFileName();
    //             Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
    //             intent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(new File(mPhotoPath)));
    //             startActivityForResult(intent, REQ_CODE_PICKCUTRE);
    //             break;
    //         //갤러리로 부터 이미지 가져오기
    //         case R.id.write_image_gallery:
    //             intent = new Intent(Intent.ACTION_PICK);
    //             intent.setType(MediaStore.Images.Media.CONTENT_TYPE);
    //             intent.setData(MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
    //             startActivityForResult(intent, REQ_CODE_GALLERY);
    //             break;
    //         //첨부 이미지 삭제하기
    //         case R.id.write_image_remove:
    //             mPhotoPath = null;
    //             hideImageAttachButton(false);
    //             mImageView.setVisibility(View.INVISIBLE);
    //             ((Button) findViewById(R.id.write_image_remove)).setVisibility(View.INVISIBLE);
    //             break;

    //         //날짜 선택하기
    //         case R.id.write_layout_titleView:
    //             GregorianCalendar gregorianCalendar = new GregorianCalendar();
    //             int year = gregorianCalendar.get(Calendar.YEAR);
    //             int month = gregorianCalendar.get(Calendar.MONTH);
    //             int day = gregorianCalendar.get(Calendar.DAY_OF_MONTH);
    //             int hour = gregorianCalendar.get(Calendar.HOUR_OF_DAY);
    //             int minute = gregorianCalendar.get(Calendar.MINUTE);
    //             DatePickerDialog datePickerDialog = new DatePickerDialog(WriteDetailActivity.this, dateSetListener, year, month, day);
    //             datePickerDialog.show();
    //             break;

    //         case R.id.write_layout_deadline:
    //             gregorianCalendar = new GregorianCalendar();
    //             year = gregorianCalendar.get(Calendar.YEAR);
    //             month = gregorianCalendar.get(Calendar.MONTH);
    //             day = gregorianCalendar.get(Calendar.DAY_OF_MONTH);
    //             datePickerDialog = new DatePickerDialog(WriteDetailActivity.this, dateSetListener2, year, month, day);
    //             datePickerDialog.show();
    //             break;
    //     }
    // }

    // private DatePickerDialog.OnDateSetListener dateSetListener = new DatePickerDialog.OnDateSetListener() {
    //     @Override
    //     public void onDateSet(DatePicker view, int year, int monthOfYear,
    //                           int dayOfMonth) {
    //         String msg = String.format("%d-%02d-%02d", year, monthOfYear + 1, dayOfMonth);
    //         mDate = msg;
    //         ((TextView) findViewById(R.id.write_layout_titleView)).setText(mDate);
    //     }
    // };

    // private DatePickerDialog.OnDateSetListener dateSetListener2 = new DatePickerDialog.OnDateSetListener() {
    //     @Override
    //     public void onDateSet(DatePicker view, int year, int monthOfYear,
    //                           int dayOfMonth) {
    //         String msg = String.format("%d-%02d-%02d", year, monthOfYear + 1, dayOfMonth);
    //         mDeadLineDate = msg;
    //         ((TextView) findViewById(R.id.write_layout_deadline)).setText(mDeadLineDate);
    //     }
    // };

    // @Override
    // protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    //     if (requestCode == REQ_CODE_PICKCUTRE) {
    //         if (resultCode == Activity.RESULT_OK) {
    //             Bitmap bm = ByteUtils.getFileBitmap(mPhotoPath);
    //             if (bm != null) {
    //                 hideImageAttachButton(true);
    //                 mImageView.setVisibility(View.VISIBLE);
    //                 mImageView.setScaleType(ImageView.ScaleType.FIT_XY);
    //                 mImageView.setImageBitmap(bm);
    //                 ((Button) findViewById(R.id.write_image_remove)).setVisibility(View.VISIBLE);
    //             }
    //         }
    //     } else if (requestCode == REQ_CODE_GALLERY) {
    //         if (data != null) {
    //             Uri imgUri = data.getData();
    //             if (imgUri != null) {
    //                 KLog.d(TAG, "@@ photo data: " + imgUri.getPath());
    //                 mPhotoPath = DataUtils.getNewFileName();
    //                 try {
    //                     String imagePath = DataUtils.getMediaScanPath(this, imgUri);
    //                     KLog.d(TAG, "@@ photo imagePath :" + imagePath);
    //                     if (imagePath == null) {
    //                         String message = getString(R.string.write_bucekt_image_attch);
    //                         Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //                     }
    //                     DataUtils.copyFile(imagePath, mPhotoPath);
    //                     ByteUtils.setFileResize(mPhotoPath, 400, 800, false);
    //                     Bitmap photo = ByteUtils.getFileBitmap(mPhotoPath);
    //                     if (photo != null) {
    //                         hideImageAttachButton(true);
    //                         mImageView.setVisibility(View.VISIBLE);
    //                         mImageView.setScaleType(ImageView.ScaleType.FIT_XY);
    //                         mImageView.setImageBitmap(photo);
    //                         ((Button) findViewById(R.id.write_image_remove)).setVisibility(View.VISIBLE);
    //                     }
    //                 } catch (IOException e) {
    //                     e.printStackTrace();
    //                 }
    //             }
    //         }
    //     }

    // }

    // /**
    //  * DB 데이타 불러와서 데이타 표시하기
    //  */

    // private void setData() {
    //     LinkedHashMap<String, String> memoMap = mSqlQuery.selectKbucket(getApplicationContext(), mContents);
    //     if (memoMap == null || memoMap.toString() == null) {
    //         return;
    //     }
    //     KLog.d(this.getClass().getSimpleName(), "@@ memoMap" + memoMap.toString());
    //     mDate = memoMap.get("date");
    //     String yn = memoMap.get("complete_yn");
    //     if (yn != null && yn.equals("Y")) {
    //         mCheckbox.setChecked(true);
    //     } else {
    //         mCheckbox.setChecked(false);
    //     }
    //     mPhotoPath = memoMap.get("image_path");
    //     // 이미지 정보가 있는 경우
    //     Bitmap bm = BitmapFactory.decodeFile(mPhotoPath);
    //     if (mPhotoPath != null && !mPhotoPath.equals("") && bm != null) {
    //         hideImageAttachButton(true);
    //         mImageView.setVisibility(View.VISIBLE);
    //         mImageView.setScaleType(ImageView.ScaleType.FIT_XY);
    //         mImageView.setImageBitmap(bm);
    //         ((Button) findViewById(R.id.write_image_remove)).setVisibility(View.VISIBLE);
    //     } else {
    //         hideImageAttachButton(false);
    //         mImageView.setVisibility(View.INVISIBLE);
    //     }
    //     mDeadLineDate = memoMap.get("deadline");

    //     ((TextView) findViewById(R.id.write_layout_titleView)).setText(mDate);
    //     ((TextView) findViewById(R.id.write_layout_titleView)).setOnClickListener(this);
    //     ((TextView) findViewById(R.id.write_layout_contentView)).setText(mContents);
    //     ((TextView) findViewById(R.id.write_layout_deadline)).setText(mDeadLineDate);
    //     ((TextView) findViewById(R.id.write_layout_deadline)).setOnClickListener(this);
    // }

    // /**
    //  * DB 데이타 동기화하기
    //  */
    // private void updateDBDate() {
    //     String NewContents = ((TextView) findViewById(R.id.write_layout_contentView)).getText().toString();
    //     String completeYN = mCheckbox.isChecked() ? "Y" : "N";
    //     String imagePath = mPhotoPath != null ? mPhotoPath : "";
    //     mSqlQuery.updateMemoContent(getApplicationContext(), mContents, NewContents, completeYN, mDate, imagePath, mDeadLineDate);
    // }

    // /**
    //  * DB 데이타 동기화하기(삭제)
    //  */
    // private void removeDBData(String Content) {
    //     KLog.d(this.getClass().getSimpleName(), "@@ remove Data Contents : " + Content);
    //     mSqlQuery.deleteUserBucket(getApplicationContext(), Content);
    // }

    // /**
    //  * 이미지 첨부 버튼 보이게 하기/숨기기 메소드
    //  *
    //  * @param ishide 숨기기 여부 (true - 숨기기)
    //  */
    // private void hideImageAttachButton(boolean ishide) {
    //     if (ishide) {
    //         ((Button) findViewById(R.id.write_image_camera)).setVisibility(View.GONE);
    //         ((Button) findViewById(R.id.write_image_gallery)).setVisibility(View.GONE);
    //     } else {
    //         ((Button) findViewById(R.id.write_image_camera)).setVisibility(View.VISIBLE);
    //         ((Button) findViewById(R.id.write_image_gallery)).setVisibility(View.VISIBLE);
    //     }
    // }

    // private void setTextPont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((Button) findViewById(R.id.write_saveButton)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.write_deleteButton)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.write_shareButton)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.write_image_camera)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.write_image_gallery)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.write_detail_text1)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.write_detail_text2)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.write_detail_text3)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.write_layout_titleView)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.write_layout_contentView)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.write_detail_text4)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.write_layout_deadline)).setTypeface(typeFace);
    // }

    // @Override
    // public void onPopupAction(int popId, int what, Object obj) {
    //     if (popId == OnPopupEventListener.POPUP_BUCKET_SHARE) {
    //         if (what == POPUP_BTN_OK) {
    //             mHandler.sendEmptyMessage(SELECT_BUCKET_CATEGORY);
    //         }
    //         mConfirmPopup.closeDialog();
    //     } else if (popId == OnPopupEventListener.POPUP_BUCKET_DELETE) {
    //         if (what == POPUP_BTN_OK) {
    //             removeDBData(mContents);
    //             onBackPressed();
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
    //             mHandler.sendEmptyMessage(UPLOAD_BUCKET);
    //         }
    //         mCategoryPopup.closeDialog();
    //     }
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
    //     bucket.setContent(mContents);
    //     bucket.setImageUrl("");
    //     bucket.setDate(mDate);
    //     bucket.setCategoryCode(mCategory);
    //     return bucket.toHasnMap();
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
    //                     if (mPhotoPath != null && !mPhotoPath.equals("")) {
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

    // @Override
    // public boolean handleMessage(Message msg) {
    //     switch (msg.what) {
    //         case TOAST_MASSEGE:
    //             Toast.makeText(getApplicationContext(), (String) msg.obj, Toast.LENGTH_LONG).show();
    //             break;
    //         case UPLOAD_IMAGE:
    //             String photoPath = mPhotoPath;
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
}