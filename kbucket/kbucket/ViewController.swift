//
//  ViewController.swift
//  kbucket
//
//  Created by 김미혜 on 2017. 6. 16..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    private let TAG : String = "ViewController"

    @IBOutlet weak var btWrite: UIButton!
    @IBOutlet weak var btComplete: UIButton!
    @IBOutlet weak var btShare: UIButton!
    @IBOutlet weak var btRank: UIButton!
    @IBOutlet weak var btSetting: UIButton!
    @IBOutlet weak var btAI: UIButton!
    @IBOutlet weak var btNotice: UIButton!

    private let TOAST_MASSEGE : Int         = 0
    private let WRITE_BUCEKT : Int          = 10
    private let BUCKET_LIST : Int           = 20
    private let SHOW_CONF : Int             = 30
    private let SHARE_THE_WORLD : Int       = 40
    private let NOTICE : Int                = 50
    private let UPDATE_USER : Int           = 60
    private let REQUEST_AI : Int            = 70
    private let FAIL_AI : Int               = 71
    private let RESPOND_AI : Int            = 72
    private let CHECK_VERSION : Int         = 80
    private let UPLOAD_DB : Int             = 90

    private var mSqlQuery  : SQLQuery? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "ViewController", msg: "viewDidLoad");
       
        var temp = DateUtils.getStringDateFormat(pattern : "yyyy-MM-dd")
        KLog.d(tag: "ViewController", msg: temp)
        temp = DateUtils.getCurrentTimeHHMMSSMS()
        KLog.d(tag: "ViewController", msg: temp)
        temp = DateUtils.convertTime()
        KLog.d(tag: "ViewController", msg: temp)
        initialize()
    }

    func initialize(){
        mSqlQuery = SQLQuery()
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
         KLog.d(tag: "ViewController", msg: "viewWillAppear");
    }
    
    override func viewDidAppear(_ animated: Bool) {
        KLog.d(tag: "ViewController", msg: "viewDidAppear");
        Toast.showToast(message: "enjoy your programming")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        KLog.d(tag: "ViewController", msg: "viewWillDisappear");
    }
    
    override func viewDidDisappear(_ animated: Bool) {
         KLog.d(tag: "ViewController", msg: "viewDidDisappear");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        KLog.d(tag: "ViewController", msg: "didReceiveMemoryWarning");
    }
        
    @IBAction func onClickWriteBucket(_ sender: Any) {
        changeView(viewName: "WriteView")
    }
    
    @IBAction func onClickComplete(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickComplete")
        changeView(viewName: "BucketListView")
    }
    
    @IBAction func onClickShare(_ sender: Any) {
        changeView(viewName: "ShareListView")
    }
    
    @IBAction func onClickRank(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickRank");
    }
    
    @IBAction func onClickSetting(_ sender: Any) {
         KLog.d(tag: "ViewController", msg: "onClickSetting");
        changeView(viewName: "SetNickNameView")
    }
   
    @IBAction func onClickAI(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickAI");

    }
    
    @IBAction func onClickNotice(_ sender: Any) {
        KLog.d(tag: "ViewController", msg: "onClickNotice");
    }

    func changeView(viewName : String){
        KLog.d(tag: TAG, msg: "changeView : " + viewName)
        let uvc = self.storyboard?.instantiateViewController(withIdentifier: viewName)
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
    }

    func handleMessage(what : Int, obj : String) {
        
        switch (what) {
//            case TOAST_MASSEGE:
//                Toast.showToast(message: obj)
//                break;
//            case WRITE_BUCEKT://버킷 작성
//                changeView(viewName: "WriteViewCtrl")
//                break;
//            case BUCKET_LIST://리스트 목록 보여주기
//    //             intent = new Intent(this, BucketListActivity.class);
//    //             startActivity(intent);
//                break;
            case SHOW_CONF://환경설정 보여주기
    //             intent = new Intent(this, ConfigurationActivity.class);
    //             startActivity(intent);
                break;
//            case SHARE_THE_WORLD://공유화면 보여주기
//                changeView(viewName: "ShareListViewCtlr")
//                break;
//            case NOTICE://공지사항 화면 보여주기
//                changeView(viewName: "NoticeViewCtlr")
//                break;
//            case UPDATE_USER://사용자 정보 없데이트
//    //             UserUpdateTask userUpdateTask = new UserUpdateTask(this, getUserData());
//    //             userUpdateTask.execute();
//                break;
//            case REQUEST_AI:
//    //             String userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
//    //             HttpUrlTaskManager httpUrlTaskManager = new HttpUrlTaskManager(ContextUtils.KBUCKET_AI, true, this, IHttpReceive.REQUEST_AI);
//    //             HashMap<String, Object> map = new HashMap<String, Object>();
//    //             map.put("nickname", userNickName);
//    //             httpUrlTaskManager.execute(StringUtils.getHTTPPostSendData(map));
//                break;
//            case FAIL_AI:
//    //             KProgressDialog.setDataLoadingDialog(this, false, null, false);
//    //             String title = getString(R.string.popup_title);
//    //             String content = getString(R.string.popup_prepare_string);
//    //             mBasicPopup = new BasicPopup(this, title, content, R.layout.popup_basic, this, OnPopupEventListener.POPUP_BASIC);
//    //             mBasicPopup.showDialog();
//                break;
//            case RESPOND_AI:// AI 대답
//    //             KProgressDialog.setDataLoadingDialog(this, false, null, false);
//    //             mAIPopup = new AIPopup(this, (String) message.obj, R.layout.popup_ai, this, OnPopupEventListener.POPUP_AI);
//    //             mAIPopup.showDialog();
//                break;
//            case CHECK_VERSION://버전 체크
//    //             AppUpdateTask appUpdateTask = new AppUpdateTask(this);
//    //             appUpdateTask.execute();
//                break;
//            case UPLOAD_DB:
//    //             String path = (String) message.obj;
//    //             int nIndex = path.indexOf(ContextUtils.KEY_FILE_FOLDER + "/");
//    //             String fileName = path.substring(nIndex + 6, path.length());
//    //             userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
//    //             byte[] bytes = ByteUtils.getByteArrayFromFile(path);
//    //             HttpUrlFileUploadManager httpUrlFileUploadManager = new HttpUrlFileUploadManager(ContextUtils.KBUCKET_UPLOAD_DB_URL, this, IHttpReceive.UPLOAD_DB, bytes);
//    //             httpUrlFileUploadManager.execute(path, "nickname", userNickName, fileName);
//                break;
        default:
            break;
        }
    }

    @IBAction func onBackPressed(_ sender: Any) {
         openExitToast()
    }    

    /**
    * 두번 뒤로가기 누를 시 종료됨
    */
    private func openExitToast() {
        //if (System.currentTimeMillis() > backKeyPressedTime + 2000) {
        //     backKeyPressedTime = System.currentTimeMillis();
        //     String msg = getString(R.string.back_string);
        //     finishToast = Toast.makeText(MainActivity.this, msg, Toast.LENGTH_SHORT);
        //     finishToast.show();
        //     return;
        // }
        // if (System.currentTimeMillis() <= backKeyPressedTime + 2000) {
        //     if (finishToast != null) {
        //         finishToast.cancel();
        //     }
        //     finish();
        // }
    }

    func onHttpReceive(type: Int, actionId: Int, data: Data) {
        KLog.d(tag : TAG, msg : "@@ onHttpReceive actionId: " + String(actionId));
        KLog.d(tag : TAG, msg : "@@ onHttpReceive  type: " + String(type));
        var isValid : Bool  = false
        var message : String 
 
        if (actionId == ConstHTTP.REQUEST_AI) {
            if (type == ConstHTTP.HTTP_OK) {
                do {
                        if let jsonString = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                            if jsonString != nil {
                                isValid = jsonString["isValid"] as! Bool
                                message = jsonString["replay"] as! String
                                // print(jsonString)
                            }
                        }
                } catch {
                    print("JSON 파상 에러")
                     handleMessage(what: FAIL_AI, obj: "")
                }
                handleMessage(what: RESPOND_AI, obj: "")
            } else {
                handleMessage(what: FAIL_AI, obj: "")
            }
        } else if (actionId == ConstHTTP.UPLOAD_DB) {
            if (type == ConstHTTP.HTTP_OK) {
                handleMessage(what: TOAST_MASSEGE, obj: "메모가지 서버에 DB를 업로드하였습니다\nDB 파일이 필요하시면 문의해주세요")
             } else {
                handleMessage(what: TOAST_MASSEGE, obj: "메모가지 서버에 DB를 업로드하는데 실패하였습니다")
             }
        }
    }

}

