//
//  MainViewCtlr.swift
//  메인
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit



class MainViewCtlr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "MainViewCtlr", msg: "viewDidLoad");
    }

    // private final String TAG = this.getClass().getSimpleName();
    // private Handler mHandler;
    // private long backKeyPressedTime = 0L;
    // private Toast finishToast;
    // private BasicPopup mBasicPopup;
    // private AIPopup mAIPopup;

    // private final int TOAST_MASSEGE = 0;
    // private final int WRITE_BUCEKT = 10;
    // private final int BUCKET_LIST = 20;
    // private final int SHOW_CONF = 30;
    // private final int SHARE_THE_WORLD = 40;
    // private final int NOTICE = 50;
    // private final int UPDATE_USER = 60;
    // private final int REQUEST_AI = 70;
    // private final int FAIL_AI = 71;
    // private final int RESPOND_AI = 72;
    // private final int CHECK_VERSION = 80;
    // private final int UPLOAD_DB = 90;

    // private DrawerLayout mDrawer;
    // private ActionBarDrawerToggle mToggle;
    // private ListView mDrawerList;
    // private final int FILE_SELECT_CODE = 30;
    // private final int MY_PERMISSION_REQUEST = 1000;

    // private boolean mbInitialUserUpdate = false;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.main_activity);
    //     String token = FirebaseInstanceId.getInstance().getToken();
    //     KLog.d(this.getClass().getSimpleName(), "@@ main FCM token : " + token);

    //     mDrawerList = (ListView) findViewById(R.id.drawer_list);

    //     setBackgroundColor();
    //     setTextPont();

    //     String[] confDatas = getResources().getStringArray(R.array.confList);

    //     confDatas[8] += ": " + AppUtils.getVersionName(this);
    //     mDrawerList.setAdapter(new ArrayAdapter<String>(this,
    //             android.R.layout.simple_list_item_1, confDatas));
    //     mDrawerList.setOnItemClickListener(new DrawerItemClickListener());

    //     mDrawer = (DrawerLayout) findViewById(R.id.dl_activity_main_drawer);
    //     mToggle = new ActionBarDrawerToggle(this, mDrawer,
    //             R.string.navigation_drawer_open, R.string.navigation_drawer_close) {

    //         @Override
    //         public void onDrawerClosed(View drawerView) {
    //             super.onDrawerClosed(drawerView);
    //         }

    //         @Override
    //         public void onDrawerOpened(View drawerView) {
    //             super.onDrawerOpened(drawerView);
    //         }

    //     };
    //     mDrawer.setDrawerListener(mToggle);

    //     mHandler = new Handler(this);
    //     Thread.setDefaultUncaughtExceptionHandler(new ErrorLogUtils.UncaughtExceptionHandlerApplication());

    //     SQLQuery sqlQuery = new SQLQuery();
    //     sqlQuery.createTable(getApplicationContext());
    //     sqlQuery.createChatTable(getApplicationContext());
    //     //이벤트 리스너 등록
    //     ((Button) findViewById(R.id.main_writeBtn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.main_update_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.main_ai_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.main_listBtn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.main_bucketlistBtn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.main_conf_btn)).setOnClickListener(this);
    //     ((Button) findViewById(R.id.main_bucketRankBtn)).setOnClickListener(this);

    //     AdView adView = new AdView(this);
    //     adView.setAdUnitId(ContextUtils.KBUCKET_AD_UNIT_ID);
    //     adView.setAdSize(AdSize.BANNER);
    //     LinearLayout layout = (LinearLayout) findViewById(R.id.main_ad_layout);
    //     layout.addView(adView);
    //     AdRequest adRequest = new AdRequest.Builder().build();
    //     adView.loadAd(adRequest);

    //     Intent getIntent = getIntent();
    //     String data = getIntent.getStringExtra(ContextUtils.WIDGET_SEND_DATA);
    //     if (data != null && data.equals(ContextUtils.WIDGET_SHARE)) {
    //         ShareSocial();
    //     }
    //     mHandler.sendEmptyMessage(CHECK_VERSION);
    //     checkPermision();

    //     AppUtils.sendTrackerScreen(this, "메인화면");
    // }

    // private void setBackgroundColor() {
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.main_back_color).setBackgroundColor(color);
    //     }
    // }


    // @Override
    // protected void onStart() {
    //     super.onStart();

    //     String userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //     if (userNickName == null || userNickName.equals("null")) {
    //         Intent intent = new Intent(this, SetNickNameActivity.class);
    //         startActivity(intent);
    //     }
    //     String gcmToken = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_GCM, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //     if (gcmToken == null) {
    //         Intent gcmRegIntent = new Intent(this, SafetyRegistrationService.class);
    //         gcmRegIntent.setPackage("momo.kikiplus.com.kbucket.Managers.push");
    //         startService(gcmRegIntent);
    //     }

    //     if(!mbInitialUserUpdate && userNickName != null && gcmToken!= null ){
    //         mbInitialUserUpdate = true;
    //         mHandler.sendEmptyMessage(UPDATE_USER);
    //     }

    // }

    // @Override
    // public void onClick(View view) {
    //     backKeyPressedTime = 0;
    //     switch (view.getId()) {
    //         case R.id.main_writeBtn:
    //             mHandler.sendEmptyMessage(WRITE_BUCEKT);
    //             break;
    //         case R.id.main_listBtn:
    //             mHandler.sendEmptyMessage(BUCKET_LIST);
    //             break;
    //         case R.id.main_bucketlistBtn:
    //             //mHandler.sendEmptyMessage(SHARE_THE_WORLD);
    //             Toast.makeText(getApplicationContext(), "서비스 개편 준비중입니다~", Toast.LENGTH_LONG).show();
    //             break;
    //         case R.id.main_conf_btn:
    //             if (!mDrawer.isDrawerOpen(GravityCompat.START)) {
    //                 mDrawer.openDrawer(GravityCompat.START);
    //             }
    //             break;
    //         case R.id.main_update_btn:
    //             //mHandler.sendEmptyMessage(NOTICE);
    //             Toast.makeText(getApplicationContext(), "서비스 개편 준비중입니다~", Toast.LENGTH_LONG).show();
    //             break;
    //         case R.id.main_ai_btn:
    //             //KProgressDialog.setDataLoadingDialog(this, true, this.getString(R.string.loading_string), true);
    //             //mHandler.sendEmptyMessage(REQUEST_AI);
    //             Toast.makeText(getApplicationContext(), "서비스 개편 준비중입니다~", Toast.LENGTH_LONG).show();
    //             break;
    //         case R.id.main_bucketRankBtn:
    //             //Intent intent = new Intent(this, RankListActivity.class);
    //             //startActivity(intent);
    //             Toast.makeText(getApplicationContext(), "서비스 개편 준비중입니다~", Toast.LENGTH_LONG).show();
    //             break;

    //     }
    // }

    // @Override
    // public boolean handleMessage(Message message) {
    //     switch (message.what) {
    //         case TOAST_MASSEGE://메시지 출력
    //             Toast.makeText(getApplicationContext(), (String) message.obj, Toast.LENGTH_LONG).show();
    //             break;
    //         case WRITE_BUCEKT://버킷 작성
    //             Intent intent = new Intent(this, WriteActivity.class);
    //             startActivity(intent);
    //             break;
    //         case BUCKET_LIST://리스트 목록 보여주기
    //             intent = new Intent(this, BucketListActivity.class);
    //             startActivity(intent);
    //             break;
    //         case SHOW_CONF://환경설정 보여주기
    //             intent = new Intent(this, ConfigurationActivity.class);
    //             startActivity(intent);
    //             break;
    //         case SHARE_THE_WORLD://공유화면 보여주기
    //             intent = new Intent(this, ShareListActivity.class);
    //             startActivity(intent);
    //             break;
    //         case NOTICE://공지사항 화면 보여주기
    //             intent = new Intent(this, NoticeActivity.class);
    //             startActivity(intent);
    //             break;
    //         case UPDATE_USER://사용자 정보 없데이트
    //             UserUpdateTask userUpdateTask = new UserUpdateTask(this, getUserData());
    //             userUpdateTask.execute();
    //             break;
    //         case REQUEST_AI:
    //             String userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //             HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_AI, true, this, IHttpReceive.REQUEST_AI);
    //             HashMap<String, Object> map = new HashMap<String, Object>();
    //             map.put("nickname", userNickName);
    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
    //             break;
    //         case FAIL_AI:
    //             KProgressDialog.setDataLoadingDialog(this, false, null, false);
    //             String title = getString(R.string.popup_title);
    //             String content = getString(R.string.popup_prepare_string);
    //             mBasicPopup = new BasicPopup(this, title, content, R.layout.popup_basic, this, OnPopupEventListener.POPUP_BASIC);
    //             mBasicPopup.showDialog();
    //             break;
    //         case RESPOND_AI:// AI 대답
    //             KProgressDialog.setDataLoadingDialog(this, false, null, false);
    //             mAIPopup = new AIPopup(this, (String) message.obj, R.layout.popup_ai, this, OnPopupEventListener.POPUP_AI);
    //             mAIPopup.showDialog();
    //             break;
    //         case CHECK_VERSION://버전 체크
    //             AppUpdateTask appUpdateTask = new AppUpdateTask(this);
    //             appUpdateTask.execute();
    //             break;
    //         case UPLOAD_DB:
    //             String path = (String) message.obj;
    //             int nIndex = path.indexOf(ContextUtils.KEY_FILE_FOLDER + "/");
    //             String fileName = path.substring(nIndex + 6, path.length());
    //             userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //             byte[] bytes = ByteUtils.getByteArrayFromFile(path);
    //             HttpUrlFileUploadManager httpUrlFileUploadManager = new HttpUrlFileUploadManager(ContextUtils.KBUCKET_UPLOAD_DB_URL, this, IHttpReceive.UPLOAD_DB, bytes);
    //             httpUrlFileUploadManager.execute(path, "nickname", userNickName, fileName);
    //             break;
    //     }
    //     return false;
    // }

    // /**
    //  * 소셜로 가지 앱 홍보하기
    //  */
    // private void ShareSocial() {
    //     Intent msg = new Intent(Intent.ACTION_SEND);
    //     msg.addCategory(Intent.CATEGORY_DEFAULT);
    //     msg.putExtra(Intent.EXTRA_SUBJECT, this.getString(R.string.share_title));
    //     msg.putExtra(Intent.EXTRA_TEXT, this.getString(R.string.share_contents));
    //     msg.setType("text/plain");
    //     startActivity(Intent.createChooser(msg, "공유"));
    // }

    // @Override
    // public void onBackPressed() {
    //     openExitToast();
    // }

    // /**
    //  * 두번 뒤로가기 누를 시 종료됨
    //  */
    // private void openExitToast() {
    //     if (System.currentTimeMillis() > backKeyPressedTime + 2000) {
    //         backKeyPressedTime = System.currentTimeMillis();
    //         String msg = getString(R.string.back_string);
    //         finishToast = Toast.makeText(MainActivity.this, msg, Toast.LENGTH_SHORT);
    //         finishToast.show();
    //         return;
    //     }
    //     if (System.currentTimeMillis() <= backKeyPressedTime + 2000) {
    //         if (finishToast != null) {
    //             finishToast.cancel();
    //         }
    //         finish();
    //     }
    // }

    // @Override
    // public void onPopupAction(int popId, int what, Object obj) {
    //     if (popId == POPUP_BASIC) {
    //         if (what == POPUP_BTN_OK || what == POPUP_BTN_CLOSEE || what == POPUP_DISPOSE) {
    //             mBasicPopup.closeDialog();
    //         }
    //     }
    // }

    // /**
    //  * 사용자 정보업데이트 가공 데이타 만드는 메소드
    //  *
    //  * @return 사용자 정보
    //  */
    // private MobileUser getUserData() {
    //     MobileUser mobileUser = new MobileUser();
    //     String userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //     mobileUser.setUserNickName(userNickName);
    //     mobileUser.setVersionName(AppUtils.getVersionName(this));
    //     mobileUser.setLanuage(AppUtils.getUserPhoneLanuage(this));
    //     mobileUser.setCountry(AppUtils.getUserPhoneCoutry(this));
    //     String date = DateUtils.getStringDateFormat(DateUtils.DATE_YYMMDD_PATTER, new Date());
    //     mobileUser.setCreateDt(date);
    //     String gcmToken = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_GCM, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //     mobileUser.setGcmToken(gcmToken);
    //     return mobileUser;
    // }

    // @Override
    // public void onHttpReceive(int type, int actionId, Object obj) {
    //     KLog.d(this.getClass().getSimpleName(), "@@ onHttpReceive : " + obj);
    //     // 버킷 공유 결과
    //     String mData = (String) obj;
    //     boolean isValid = false;
    //     String message = null;
    //     if (actionId == IHttpReceive.REQUEST_AI) {
    //         if (type == HTTP_OK) {
    //             if (mData != null) {
    //                 try {
    //                     JSONObject json = new JSONObject(mData);
    //                     isValid = json.getBoolean("isValid");
    //                     message = json.getString("replay");
    //                 } catch (JSONException e) {
    //                     ErrorLogUtils.saveFileEror("@@ AI Respond jsonException message : " + e.getMessage());
    //                     mHandler.sendEmptyMessage(FAIL_AI);
    //                 }
    //             }
    //             mHandler.sendMessage(mHandler.obtainMessage(RESPOND_AI, message));
    //         } else {
    //             mHandler.sendEmptyMessage(FAIL_AI);
    //         }
    //     } else if (actionId == IHttpReceive.UPLOAD_DB) {
    //         if (type == HTTP_OK) {
    //             mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, "메모가지 서버에 DB를 업로드하였습니다\nDB 파일이 필요하시면 문의해주세요"));
    //         } else {
    //             mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, "메모가지 서버에 DB를 업로드하는데 실패하였습니다"));
    //         }
    //     }
    // }

    // private void setTextPont() {
    //     Typeface typeFace = DataUtils.getHannaFont(getApplicationContext());
    //     ((Button) findViewById(R.id.main_writeBtn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.main_listBtn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.main_bucketlistBtn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.main_conf_btn)).setTypeface(typeFace);
    //     ((Button) findViewById(R.id.main_bucketRankBtn)).setTypeface(typeFace);
    // }

    // private class DrawerItemClickListener implements ListView.OnItemClickListener {
    //     @Override
    //     public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
    //         selectItem(position);
    //     }
    // }

    // private void selectItem(int position) {
    //     switch (position) {
    //         case 0://암호설정
    //             Intent intent = new Intent(this, PassWordActivity.class);
    //             intent.putExtra("SET", "SET");
    //             startActivity(intent);
    //             break;
    //         case 1://암호해제
    //             String message = getString(R.string.password_cancle_string);
    //             Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //             SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KEY_CONF_PASSWORD, "");
    //             break;
    //         case 2://DB 복원
    //             showFileChooser();
    //             break;
    //         case 3://DB 백업
    //             Date date = new Date();
    //             String newDBName = DateUtils.getStringDateFormat(DateUtils.KBUCKET_DB_DATE_PATTER, date);
    //             boolean isResult = DataUtils.exportDB(newDBName);
    //             if (isResult) {
    //                 String mssage = getString(R.string.db_backup_path_string);
    //                 String path = Environment.getExternalStorageDirectory() + "/" + ContextUtils.KEY_FILE_FOLDER + "/" + newDBName + ".db";
    //                 mHandler.sendMessage(mHandler.obtainMessage(UPLOAD_DB, path));
    //                 Toast.makeText(getApplicationContext(), mssage + "\n" + ContextUtils.KEY_FILE_FOLDER + "/" + newDBName + ".db", Toast.LENGTH_LONG).show();
    //             } else {
    //                 String mssage = getString(R.string.db_backup_faile_string);
    //                 Toast.makeText(getApplicationContext(), mssage, Toast.LENGTH_LONG).show();
    //             }
    //             break;
    //         case 4://별명설정
    //             intent = new Intent(this, SetNickNameActivity.class);
    //             startActivity(intent);
    //             break;
    //         case 5://배경설정
    //             intent = new Intent(this, SetBackColorActivity.class);
    //             startActivity(intent);
    //             break;
    //         case 6://튜토리얼
    //             intent = new Intent(this, TutorialActivity.class);
    //             startActivity(intent);
    //             break;
    //         case 7://문의하기
    //             intent = new Intent(this, QuestionActivity.class);
    //             startActivity(intent);
    //             break;
    //         case 8://버전체크
    //             mHandler.sendEmptyMessage(CHECK_VERSION);
    //             break;
    //         case 9://관리자 블로그가기
    //             intent = new Intent(Intent.ACTION_VIEW, Uri.parse(ContextUtils.KBUCKET_BLOG));
    //             startActivity(intent);
    //             break;
    //         case 10://공유하기
    //             ShareSocial();
    //             break;
    //         case 11://관심 버킷 추가하기
    //             intent = new Intent(this, AddBucketActivity.class);
    //             startActivity(intent);
    //             break;
    //     }
    //     mDrawer.closeDrawer(mDrawerList);
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
    //                 boolean isResult = DataUtils.importDB(uri.getPath());
    //                 if (isResult) {
    //                     String msaage = getString(R.string.db_import_success_string);
    //                     Toast.makeText(getApplicationContext(), msaage, Toast.LENGTH_LONG).show();
    //                 } else {
    //                     String msaage = getString(R.string.db_import_fail_string);
    //                     Toast.makeText(getApplicationContext(), msaage, Toast.LENGTH_LONG).show();
    //                 }
    //             }
    //             break;
    //     }
    //     super.onActivityResult(requestCode, resultCode, data);
    // }

    // private void checkPermision() {
    //     if (Build.VERSION.SDK_INT >= 23) {
    //         if (checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE)
    //                 != PackageManager.PERMISSION_GRANTED
    //                 || checkSelfPermission(Manifest.permission.READ_EXTERNAL_STORAGE)
    //                 != PackageManager.PERMISSION_GRANTED) {

    //             requestPermissions(new String[]{Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.WRITE_EXTERNAL_STORAGE},
    //                     MY_PERMISSION_REQUEST);

    //         }
    //     }
    // }

    // @Override
    // public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
    //     switch (requestCode) {
    //         case MY_PERMISSION_REQUEST:
    //             boolean isReulst = DataUtils.createFile();
    //             if (!isReulst) {
    //                 mHandler.sendMessage(mHandler.obtainMessage(TOAST_MASSEGE, "권한을 모두 허용해주셔야 앱을 정상적으로 사용할 수 있습니다."));
    //             }
    //             break;
    //     }
    // }

}
