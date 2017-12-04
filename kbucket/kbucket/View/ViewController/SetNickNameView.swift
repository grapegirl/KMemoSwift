//
//  SetNickNameView.swift
//  사용자 닉네임 설정
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class SetNickNameView : UIViewController {

    private let TAG : String = "SetNickNameView"
    private var mSqlQuery : SQLQuery? = nil
    // private Button mButton;

    override func viewDidLoad() {
        super.viewDidLoad()
        KLog.d(tag: TAG, msg: "viewDidLoad")
        initialize()
    }

    func initialize(){
        mSqlQuery = SQLQuery()
        let nickname = UserDefault.read(key: ContextUtils.KEY_USER_NICKNAME)
        if(nickname != nil){
            // ((EditText) findViewById(R.id.nickname_editText)).setText(nickname);
            // ((EditText) findViewById(R.id.nickname_editText)).requestFocus(nickname.length());
        }
        //AppUtils.sendTrackerScreen(this, "닉네임변경화면");
    }
    
    @IBAction func onClick(_ sender: Any) {
    //     String nickname = ((EditText) findViewById(R.id.nickname_editText)).getText().toString();
    //     KLog.d(this.getClass().getSimpleName(), "@@ nickname : " + nickname);
    //     nickname = nickname.replaceAll(" ","");
    //     if (nickname.equals("") || nickname == null) {
    //         String message = getString(R.string.nickname_fail_string);
    //         Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    //         return;
    //     }
    //     SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KEY_USER_NICKNAME, nickname);
    //     mSqlQuery.updateUserNickName(this, nickname);
    //     finish();
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        ViewUtils.changeView(strView: ContextUtils.MAIN_VIEW, viewCtrl: self)
    }
}
