//
//  SetNickNameViewCtlr.swift
//  사용자 닉네임 설정
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class SetNickNameViewCtlr: UIViewController {

    private let TAG : String = "SetNickNameViewCtlr"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: TAG, msg: "viewDidLoad");
    }

    // private final String TAG = this.getClass().getSimpleName();
    // private Button mButton;
    // private SQLQuery mSqlQuery = null;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.set_nickname_activity);
    //     setBackgroundColor();

    //     mSqlQuery = new SQLQuery();
    //     mButton = (Button) findViewById(R.id.nickname_okBtn);
    //     mButton.setOnClickListener(this);

    //     String nickname = (String)SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.KEY_USER_NICKNAME, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //     if(nickname != null){
    //         ((EditText) findViewById(R.id.nickname_editText)).setText(nickname);
    //         ((EditText) findViewById(R.id.nickname_editText)).requestFocus(nickname.length());
    //     }
    //     AppUtils.sendTrackerScreen(this, "닉네임변경화면");
    // }

    // private void setBackgroundColor(){
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.nickname_back_color).setBackgroundColor(color);
    //     }
    // }

    // @Override
    // public void finish() {
    //     super.finish();
    //     this.overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right);
    // }

    // @Override
    // public void onClick(View v) {
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
    // }

    // @Override
    // public void onBackPressed() {
    //     finish();
    // }
}
