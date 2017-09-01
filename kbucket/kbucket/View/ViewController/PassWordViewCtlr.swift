﻿//
//  PassWordViewCtlr.swift
//  패스워드
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class PassWordViewCtlr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "PassWordViewCtlr", msg: "viewDidLoad");
    }

    // private final String TAG = this.getClass().getSimpleName();
    // private Button[] mButton;
    // private ArrayList<String> mPasswordData;
    // private boolean isPasswordset = false;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.password_activity);
    //     setBackgroundColor();
    //     mButton = new Button[15];
    //     mPasswordData = new ArrayList<>();

    //     mButton[0] = (Button) findViewById(R.id.password_clear);
    //     mButton[1] = (Button) findViewById(R.id.password_btn1);
    //     mButton[2] = (Button) findViewById(R.id.password_btn2);
    //     mButton[3] = (Button) findViewById(R.id.password_btn3);
    //     mButton[4] = (Button) findViewById(R.id.password_btn4);
    //     mButton[5] = (Button) findViewById(R.id.password_num0);
    //     mButton[6] = (Button) findViewById(R.id.password_num1);
    //     mButton[7] = (Button) findViewById(R.id.password_num2);
    //     mButton[8] = (Button) findViewById(R.id.password_num3);
    //     mButton[9] = (Button) findViewById(R.id.password_num4);
    //     mButton[10] = (Button) findViewById(R.id.password_num5);
    //     mButton[11] = (Button) findViewById(R.id.password_num6);
    //     mButton[12] = (Button) findViewById(R.id.password_num7);
    //     mButton[13] = (Button) findViewById(R.id.password_num8);
    //     mButton[14] = (Button) findViewById(R.id.password_num9);

    //     for (int i = 0; i < 15; i++) {
    //         mButton[i].setOnClickListener(this);
    //     }

    //     Intent intent = getIntent();
    //     String setting = intent.getStringExtra("SET");
    //     //암호 설정
    //     if (setting != null && setting.equals("SET")) {
    //         isPasswordset = true;
    //     }// 암호 맞추기
    //     else if (setting != null && setting.equals("GET")) {
    //         isPasswordset = false;
    //     }
    //     AppUtils.sendTrackerScreen(this, "암호설정화면");
    // }

    // private void setBackgroundColor(){
    //     int color = (Integer) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.BACK_MEMO, SharedPreferenceUtils.SHARED_PREF_VALUE_INTEGER);
    //     if (color != -1) {
    //         findViewById(R.id.password_back_color).setBackgroundColor(color);
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
    //         case R.id.password_num0:
    //         case R.id.password_num1:
    //         case R.id.password_num2:
    //         case R.id.password_num3:
    //         case R.id.password_num4:
    //         case R.id.password_num5:
    //         case R.id.password_num6:
    //         case R.id.password_num7:
    //         case R.id.password_num8:
    //         case R.id.password_num9:
    //             String data = ((Button) findViewById(v.getId())).getText().toString();
    //             if (mPasswordData.size() < 4) {
    //                 mPasswordData.add(data);
    //                 printPassword();
    //                 setButtonText();
    //             }
    //             break;
    //         case R.id.password_clear:
    //             int size = mPasswordData.size();
    //             if (size > 0 && size <= 4) {
    //                 mPasswordData.remove(mPasswordData.get(size - 1));
    //                 printPassword();
    //                 setButtonText();
    //             }
    //             break;
    //     }
    // }

    // private void printPassword() {
    //     KLog.d(this.getClass().getSimpleName(), "@@ start");
    //     for (int i = 0; i < mPasswordData.size(); i++) {
    //         KLog.d(this.getClass().getSimpleName(), "@@ " + i + " 번쨰:" + mPasswordData.get(i));
    //     }
    //     KLog.d(this.getClass().getSimpleName(), "@@ end");
    // }

    // private void setButtonText() {
    //     KLog.d(this.getClass().getSimpleName(), "@@ mPasswordData size : " + mPasswordData.size());
    //     for (int i = 1; i <= mPasswordData.size(); i++) {
    //         mButton[i].setText("*");
    //     }

    //     for (int i = 1; i <= 4 - mPasswordData.size(); i++) {
    //         KLog.d(this.getClass().getSimpleName(), "@@ delete index : " + (5 - i));
    //         mButton[5 - i].setText("");
    //     }

    //     if (mPasswordData.size() == 4) {
    //         if (isPasswordset) {
    //             String pawd = mPasswordData.get(0) + "" + mPasswordData.get(1) + "" + mPasswordData.get(2) + "" + mPasswordData.get(3);
    //             SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.KEY_CONF_PASSWORD, pawd);
    //             finish();
    //         } else {
    //             String pawd = mPasswordData.get(0) + "" + mPasswordData.get(1) + "" + mPasswordData.get(2) + "" + mPasswordData.get(3);
    //             String password = (String) SharedPreferenceUtils.read(getApplicationContext(), ContextUtils.KEY_CONF_PASSWORD, SharedPreferenceUtils.SHARED_PREF_VALUE_STRING);
    //             if (!pawd.equals(password)) {
    //                 String message = getString(R.string.password_fail_string);
    //                 Toast.makeText(getApplication(), message, Toast.LENGTH_LONG).show();
    //                 mPasswordData.clear();
    //                 for (int i = 1; i <= 4; i++) {
    //                     mButton[i].setText("");
    //                 }
    //             } else {
    //                 Intent getIntent = getIntent();
    //                 String startView = getIntent.getStringExtra("DATA");
    //                 if (startView != null && startView.equals(ContextUtils.WIDGET_WRITE_BUCKET)) {
    //                     Intent intent = new Intent(this, WriteActivity.class);
    //                     startActivity(intent);
    //                     finish();
    //                 } else if (startView != null && startView.equals(ContextUtils.WIDGET_BUCKET_LIST)) {
    //                     Intent intent = new Intent(this, BucketListActivity.class);
    //                     startActivity(intent);
    //                     finish();
    //                 } else if (startView != null && startView.equals(ContextUtils.WIDGET_OURS_BUCKET)) {
    //                     Intent intent = new Intent(this, ShareListActivity.class);
    //                     startActivity(intent);
    //                     finish();
    //                 } else if (startView != null && startView.equals(ContextUtils.WIDGET_SHARE)) {
    //                     Intent intent = new Intent(this, MainActivity.class);
    //                     intent.putExtra(ContextUtils.WIDGET_SEND_DATA, ContextUtils.WIDGET_SHARE);
    //                     startActivity(intent);
    //                     finish();
    //                 } else {
    //                     Intent intent = new Intent(this, MainActivity.class);
    //                     startActivity(intent);
    //                     finish();
    //                 }
    //             }
    //         }
    //     }
    // }
}
