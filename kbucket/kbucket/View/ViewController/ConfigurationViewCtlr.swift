//
//  ConfigurationViewCtlr.swift
//  환경설정
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class ConfigurationViewCtlr: UIViewController {

    private let TAG : String = "ConfigurationViewCtlr"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: TAG, msg: "viewDidLoad");
    }
    

    // private final String TAG = this.getClass().getSimpleName();

    // private String mMarketVersionName = null;
    // private String mCurrentVersionName = null;
    // private android.os.Handler mHandler = null;

    // private final int START_VERSION = 10;
    // private final int SHOW_GOOGLE_VERSION = 20;
    // private final int FILE_SELECT_CODE = 30;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.conf_activity);

    //     setBackgroundColor();
    //     setTextPont();

    //     mHandler = new android.os.Handler(this);
    //     mCurrentVersionName = AppUtils.getVersionName(this);
    //     ((TextView) findViewById(R.id.conf_current_version)).setText(mCurrentVersionName);
    //     mHandler.sendEmptyMessage(START_VERSION);

    //     ((Button) findViewById(R.id.conf_password_on_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.conf_update_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.conf_question_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.conf_import_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.conf_export_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.conf_password_off_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.conf_guide_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.conf_userSetting)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.conf_userBackSetting)).setOnClickListener(this);
    // }

    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.conf_back_color).setBackgroundColor(color);
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
    //         //암호설정
    //         case R.id.conf_password_on_btn:
    //             Intent intent = new Intent(this, PassWordActivity.class);
    //             intent.putExtra("SET", "SET");
    //             startActivity(intent);
    //             break;
    //         //암호해제
    //         case R.id.conf_password_off_btn:
    //             String message = getString(R.string.password_cancle_string);
    //             Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //             SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KEY_CONF_PASSWORD, "");
    //             break;
    //         //업데이트
    //         case R.id.conf_update_btn:
    //             if (mMarketVersionName == null || mMarketVersionName.equals("-")) {
    //                 message = getString(R.string.version_fail_string);
    //                 Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //             } else if (StringUtils.compareVersion(mCurrentVersionName, mMarketVersionName) > 0) {
    //                 message = getString(R.string.version_update_string);
    //                 Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //                 AppUtils.locationMarket(this, getPackageName());
    //             } else {
    //                 message = getString(R.string.version_lastest_string);
    //                 Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //             }
    //             break;
    //         //문의하기
    //         case R.id.conf_question_btn:
    //             intent = new Intent(this, QuestionActivity.class);
    //             startActivity(intent);
    //             break;
    //         //복원하기
    //         case R.id.conf_import_btn:
    //             showFileChooser();
    //             break;
    //         //백업하기
    //         case R.id.conf_export_btn:
    //             Date date = new Date();
    //             String newDBName = DateUtils.getStringDateFormat(DateUtils.KBUCKET_DB_DATE_PATTER, date);
    //             boolean isResult = DataUtils.exportDB(newDBName);
    //             if (isResult) {
    //                 String mssage = getString(R.string.db_backup_path_string);
    //                 Toast.makeText(getApplicationContext(), mssage + "\n" + ContextUtils.KEY_FILE_FOLDER + "/" + newDBName + ".db", Toast.LENGTH_LONG).show();
    //             } else {
    //                 String mssage = getString(R.string.db_backup_faile_string);
    //                 Toast.makeText(getApplicationContext(), mssage, Toast.LENGTH_LONG).show();
    //             }
    //             break;
    //         //튜토리얼
    //         case R.id.conf_guide_btn:
    //             intent = new Intent(this, TutorialActivity.class);
    //             startActivity(intent);
    //             break;
    //         //별명설정
    //         case R.id.conf_userSetting:
    //             intent = new Intent(this, SetNickNameActivity.class);
    //             startActivity(intent);
    //             break;
    //         //배경 색상 설정
    //         case R.id.conf_userBackSetting:
    //             intent = new Intent(this, SetBackColorActivity.class);
    //             startActivity(intent);
    //             break;

    //     }
    // }


    // @Override
    // public void onHttpReceive(int type, int actionId, Object obj) {
    //     KLog.d(this.getClass().getSimpleName(), " @@ onHttpReceive type:" + type + ", object: " + obj);
    //     if (actionId == IHttpReceive.UPDATE_VERSION) {
    //         if (type == IHttpReceive.HTTP_OK) {
    //             String mData = (String) obj;
    //             try {
    //                 JSONObject json = new JSONObject(mData);
    //                 int versionCode = json.getInt("versionCode");
    //                 mMarketVersionName = json.getString("versionName");
    //             } catch (JSONException e) {
    //                 KLog.e(TAG, "@@ jsonException message : " + e.getMessage());
    //                 mMarketVersionName = "-";
    //             }
    //         } else {
    //             mMarketVersionName = "-";
    //         }
    //         mHandler.sendEmptyMessage(SHOW_GOOGLE_VERSION);
    //     }
    // }

    // /**
    //  * 구글 앱스토어에서 버전 명 변환하는 메소드
    //  *
    //  * @param data 구글 앱스토어 정보
    //  * @return 버전명
    //  */
    // @Deprecated
    // private String getAppVersionData(String data) {
    //     String mVer;
    //     String startToken = "softwareVersion\">";
    //     String endToken = "<";
    //     int index = data.indexOf(startToken);
    //     if (index == -1) {
    //         mVer = null;
    //     } else {
    //         mVer = data.substring(index + startToken.length(), index
    //                 + startToken.length() + 100);
    //         mVer = mVer.substring(0, mVer.indexOf(endToken)).trim();
    //     }
    //     return mVer;
    // }

    // @Override
    // public boolean handleMessage(Message msg) {
    //     switch (msg.what) {
    //         case SHOW_GOOGLE_VERSION:
    //             ((TextView) findViewById(R.id.conf_lastest_version)).setText(mMarketVersionName);
    //             break;
    //         case START_VERSION:
    //             HttpUrlTaskManager urlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_VERSION_UPDATE_URL, false, this, IHttpReceive.UPDATE_VERSION);
    //             KLog.d(TAG, "@@ URL : " + ContextUtils.KBUCKET_VERSION_UPDATE_URL);
    //             urlTaskManager.execute();
    //             break;
    //     }
    //     return false;
    // }

    // /**
    //  * 파일 선택
    //  */
    // private void showFileChooser() {
    //     Intent intent = new Intent();
    //     intent.setAction(Intent.ACTION_GET_CONTENT);
    //     intent.setType("application/zip");
    //     intent.addCategory(Intent.CATEGORY_OPENABLE);

    //     try {
    //         startActivityForResult(
    //                 Intent.createChooser(intent, "Select a File"),
    //                 FILE_SELECT_CODE);
    //     } catch (android.content.ActivityNotFoundException ex) {
    //         Toast.makeText(this, "파일 선택 오류 발생",
    //                 Toast.LENGTH_SHORT).show();
    //     }
    // }

    // @Override
    // protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    //     switch (requestCode) {
    //         case FILE_SELECT_CODE:
    //             if (resultCode == RESULT_OK) {
    //                 Uri uri = data.getData();
    //                 KLog.d(TAG, "select path : " + uri.getPath());
    //                 boolean isResult = DataUtils.importDB(uri.getPath());
    //                 if (isResult) {
    //                     String msaage = getString(R.string.db_import_success_string);
    //                     Toast.makeText(getApplicationContext(), msaage, Toast.LENGTH_LONG).show();
    //                 } else {
    //                     String msaage = getString(R.string.db_import_fail_string);
    //                     Toast.makeText(getApplicationContext(), "", Toast.LENGTH_LONG).show();
    //                 }
    //             }
    //             break;
    //     }
    //     super.onActivityResult(requestCode, resultCode, data);
    // }

    // private void setTextPont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((Button) findViewById(R.id.conf_password_on_btn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.conf_question_btn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.conf_import_btn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.conf_export_btn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.conf_password_off_btn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.conf_guide_btn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.conf_update_btn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.conf_userBackSetting)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.conf_userSetting)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.conf_current_textview)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.conf_current_version)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.conf_lastest_textview)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.conf_lastest_version)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.intro_textview1)).setTypeface(typeFace);
    //     ((TextView) findViewById(R.id.intro_textview2)).setTypeface(typeFace);
    // }
}