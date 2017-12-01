//
//  IntroViewCtlr.swift
//  인트로
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class IntroViewCtlr: UIViewController {

    private let TAG : String = "IntroViewCtlr"

    override func viewDidLoad() {
        super.viewDidLoad()
        KLog.d(tag: TAG, msg: "viewDidLoad")
        initialize()
    }

      func initialize(){
    //     Animation anim1 = new AlphaAnimation(0.0f, 1.0f);
    //     anim1.setDuration(500);
    //     Animation anim2 = new AlphaAnimation(0.0f, 1.0f);
    //     anim2.setDuration(1000);
    //     Animation anim3 = new AlphaAnimation(0.0f, 1.0f);
    //     anim3.setDuration(1000);
    //     findViewById(R.id.intro_imageview).setAnimation(anim1);
    //     findViewById(R.id.intro_imageview2).setAnimation(anim2);
    //     findViewById(R.id.intro_imageview3).setAnimation(anim3);

    //     Timer timer;
    //     TimerTask timerTask = new TimerTask() {
    //         @Override
    //         public void run() {
    //             String password = (String) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.KEY_CONF_PASSWORD, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //             if (password != null && !password.equals("")) {
    //                 mHandler.sendEmptyMessage(1);
    //             } else {
    //                 //위젯으로부터 화면 전환
    //                 Intent intent = getIntent();
    //                 String startView = intent.getStringExtra("DATA");
    //                 if (startView != null && startView.equals(ContextUtils.WIDGET_WRITE_BUCKET)) {
    //                     mHandler.sendEmptyMessage(2);
    //                 } else if (startView != null && startView.equals(ContextUtils.WIDGET_BUCKET_LIST)) {
    //                     mHandler.sendEmptyMessage(3);
    //                 } else if (startView != null && startView.equals(ContextUtils.WIDGET_OURS_BUCKET)) {
    //                     mHandler.sendEmptyMessage(4);
    //                 } else if (startView != null && startView.equals(ContextUtils.WIDGET_SHARE)) {
    //                     mHandler.sendEmptyMessage(5);
    //                 } else {
    //                     mHandler.sendEmptyMessage(0);
    //                 }
    //             }
    //         }
    //     };
    //     timer = new Timer();
    //     timer.schedule(timerTask, 2000);
    }

    func handleMessage(what : Int, obj : String) {
            switch (what) {
        //         case 0://바로 실행할때
    //             Intent intent = new Intent(this, MainActivity.class);
    //             startActivity(intent);
    //             finish();
    //             break;
    //         case 1://비밀번호 맞추기
    //             intent = new Intent(this, PassWordActivity.class);
    //             Intent intent2 = getIntent();
    //             String startView = intent2.getStringExtra("DATA");
    //             intent.putExtra("SET", "GET");
    //             intent.putExtra("DATA", startView);
    //             startActivity(intent);
    //             finish();
    //             break;
    //         case 2://가지 작성 화면
    //             intent = new Intent(this, WriteActivity.class);
    //             startActivity(intent);
    //             finish();
    //             break;
    //         case 3://리스트 화면
    //             intent = new Intent(this, BucketListActivity.class);
    //             startActivity(intent);
    //             finish();
    //             break;
    //         case 4://모두의 가지화면
    //             intent = new Intent(this, ShareListActivity.class);
    //             startActivity(intent);
    //             finish();
    //             break;
    //         case 5:
    //             intent = new Intent(this, MainActivity.class);
    //             intent.putExtra(ContextUtils.WIDGET_SEND_DATA, ContextUtils.WIDGET_SHARE);
    //             startActivity(intent);
    //             finish();
    //             break;
        }
    }

    @IBAction func onBackPressed(_ sender: Any) {
        KLog.d(tag: TAG, msg: "onBackPressed");
    }
}

