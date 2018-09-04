//
//  ViewController.swift
//  kbucket
//
//  Created by 김미혜 on 2017. 6. 16..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController , IHttpReceive {

    private let TAG : String = "ViewController"

    @IBOutlet weak var btWrite: UIButton!
    @IBOutlet weak var btComplete: UIButton!
    @IBOutlet weak var btShare: UIButton!
    @IBOutlet weak var btRank: UIButton!
    @IBOutlet weak var btSetting: UIButton!
    @IBOutlet weak var btAI: UIButton!
    @IBOutlet weak var btNotice: UIButton!
    @IBOutlet var backView: UIView!
    
    private let TOAST_MASSEGE : Int         = 0
    private let SHARE_THE_WORLD : Int       = 40
    private let UPDATE_USER : Int           = 60
    private let REQUEST_AI : Int            = 70
    private let FAIL_AI : Int               = 71
    private let RESPOND_AI : Int            = 72
    private let CHECK_VERSION : Int         = 80
    private let UPLOAD_DB : Int             = 90

    private var mSqlQuery  : SQLQuery? = nil
    private var bannerView: GADBannerView!
    public var mWidgetSendData : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KLog.d(tag: "ViewController", msg: "viewDidLoad");
        initialize()
    }

    func initialize(){
        mSqlQuery = SQLQuery()
     //     mDrawerList = (ListView) findViewById(R.id.drawer_list);

         setBackgroundColor()
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

        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = ContextUtils.KBUCKET_AD_UNIT_ID
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    //     Intent getIntent = getIntent();
    //     String data = getIntent.getStringExtra(ContextUtils.WIDGET_SEND_DATA);
    //     if (data != null && data.equals(ContextUtils.WIDGET_SHARE)) {
    //         ShareSocial();
    //     }
    //     mHandler.sendEmptyMessage(CHECK_VERSION);
        handleMessage(what: UPDATE_USER, obj: "")
        AppUtils.sendTrackerScreen(screen: "메인화면")
    }
    
    
    private func setBackgroundColor() {
        var color : String = UserDefault.read(key: ContextUtils.BACK_MEMO)
        KLog.d(tag: TAG, msg: "color : " + color)
        if color != nil {
            var uColor = UIColor(hexRGB: color)
            backView.backgroundColor = uColor
        }
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

    @IBAction func onClick(_ sender: UIButton) {
        switch sender {
        case btWrite:
            changeView(viewName: "WriteView")
            break
        case btComplete:
            changeView(viewName: "BucketListView")
            break
        case btShare:
            changeView(viewName: "ShareListView")
            break
        case btRank:
            KLog.d(tag: "ViewController", msg: "onClickRank");
            changeView(viewName: "TutorialView")
            break
        case btSetting:
            //changeView(viewName: "SetNickNameView")
            changeView(viewName: "SetBackColorView")
            break
        case btAI:
            KLog.d(tag: "ViewController", msg: "onClickAI");
            handleMessage(what: REQUEST_AI, obj: "")
            break
        case btNotice:
            changeView(viewName: "NoticeView")
            break
        default:
            break
        }
    }
    
    func changeView(viewName : String){
        KLog.d(tag: TAG, msg: "changeView : " + viewName)
        let uvc = self.storyboard?.instantiateViewController(withIdentifier: viewName)
        uvc?.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal //페이지 전환시 에니메이션 효과 설정
        present(uvc!, animated: true, completion: nil)
    }

    func handleMessage(what : Int, obj : String) {
        
        switch (what) {
            case TOAST_MASSEGE:
                Toast.showToast(message: obj)
                break
            case SHARE_THE_WORLD://공유화면 보여주기
                changeView(viewName: "ShareListViewCtlr")
                break
            case UPDATE_USER://사용자 정보 없데이트
                let userUpdateTask : UserUpdateTask = UserUpdateTask(url: ContextUtils.KBUCKET_UPDATE_USER, post: true, receive: self)
                let user = getUserData()
                let sendData = StringUtils.getHTTPPostSendData(sendData: user.toDictionary() )
                userUpdateTask.actionTaskWithData(data : sendData )
                break
            case REQUEST_AI:
                let userNickName : String = UserDefault.read(key: ContextUtils.KEY_USER_NICKNAME)
                let url  = ContextUtils.KBUCKET_AI
                let  httpUrlTaskManager : HttpUrlTaskManager =  HttpUrlTaskManager(url : url, post : true, receive : self, id : ConstHTTP.REQUEST_AI)
                var data : String = "nickname=" + userNickName
                httpUrlTaskManager.actionTaskWithData(data: data)
                break
            case FAIL_AI:
//    //             KProgressDialog.setDataLoadingDialog(this, false, null, false);
//    //             String title = getString(R.string.popup_title);
//    //             String content = getString(R.string.popup_prepare_string);
//    //             mBasicPopup = new BasicPopup(this, title, content, R.layout.popup_basic, this, OnPopupEventListener.POPUP_BASIC);
//    //             mBasicPopup.showDialog();
                break
            case RESPOND_AI:// AI 대답
//    //             KProgressDialog.setDataLoadingDialog(this, false, null, false);
                print(obj)
//    //             mAIPopup = new AIPopup(this, (String) message.obj, R.layout.popup_ai, this, OnPopupEventListener.POPUP_AI);
//    //             mAIPopup.showDialog();
                break
            case CHECK_VERSION://버전 체크
//    //             AppUpdateTask appUpdateTask = new AppUpdateTask(this);
//    //             appUpdateTask.execute();
                break
            case UPLOAD_DB:
//    //             String path = (String) message.obj;
//    //             int nIndex = path.indexOf(ContextUtils.KEY_FILE_FOLDER + "/");
//    //             String fileName = path.substring(nIndex + 6, path.length());
//    //             userNickName = (String) SharedPreferenceUtils.read(this, ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
//    //             byte[] bytes = ByteUtils.getByteArrayFromFile(path);
//    //             HttpUrlFileUploadManager httpUrlFileUploadManager = new HttpUrlFileUploadManager(ContextUtils.KBUCKET_UPLOAD_DB_URL, this, IHttpReceive.UPLOAD_DB, bytes);
//    //             httpUrlFileUploadManager.execute(path, "nickname", userNickName, fileName);
                break
        default:
            break
        }
    }

    func onHttpReceive(type: Int, actionId: Int, data: Data) {
        KLog.d(tag : TAG, msg : "@@ onHttpReceive actionId: " + String(actionId))
        KLog.d(tag : TAG, msg : "@@ onHttpReceive  type: " + String(type))
        var isValid : Bool = false
        if (actionId == ConstHTTP.REQUEST_AI) {
            if (type == ConstHTTP.HTTP_OK) {
                do {
                        if let jsonString = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                            if jsonString != nil {
                                isValid = jsonString["isValid"] as! Bool
                                let message = jsonString["replay"] as! String
                                handleMessage(what: RESPOND_AI, obj: message)
                            }
                        }
                } catch {
                    print("JSON 파상 에러")
                     handleMessage(what: FAIL_AI, obj: "")
                }
               
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
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 0.9,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }

    /**
     * 사용자 정보업데이트 가공 데이타 만드는 메소드
     *
     * @return 사용자 정보
     */
    private func getUserData() -> MobileUser {
        let mobileUser = MobileUser()
        mobileUser.mUserNickName = UserDefault.read(key: ContextUtils.KEY_USER_NICKNAME)
        mobileUser.mVersionName = AppUtils.getVersionName()
        mobileUser.mLanguage = AppUtils.getUserPhoneLanuage()
        mobileUser.mCountry = AppUtils.getUserPhoneCoutry()
        mobileUser.mGcmToken = ""
        return mobileUser;
    }
}

