//
//  SetBackColorViewCtlr.swift
//  사용자 테마 설정
//
//  Created by grapegirl on 2017. 9. 01..
//  Copyright © 2017년 kikiplus. All rights reserved.
//

import UIKit

class SetBackColorViewCtlr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KLog.d(tag: "SetBackColorViewCtlr", msg: "viewDidLoad");
    }

    // private final String TAG = this.getClass().getSimpleName();
    // private ImageButton[] mImageButton = null;

    // @Override
    // protected void onCreate(Bundle savedInstanceState) {
    //     super.onCreate(savedInstanceState);
    //     this.overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left);
    //     setContentView(R.layout.set_background_activity);
    //     setButtons();
    //     AppUtils.sendTrackerScreen(this, "테마변경화면");
    // }

    // private void setButtons() {
    //     mImageButton = new ImageButton[18];
    //     mImageButton[0] = ((ImageButton) findViewById(R.id.set_back_btn1));
    //     mImageButton[1] = ((ImageButton) findViewById(R.id.set_back_btn2));
    //     mImageButton[2] = ((ImageButton) findViewById(R.id.set_back_btn3));
    //     mImageButton[3] = ((ImageButton) findViewById(R.id.set_back_btn4));
    //     mImageButton[4] = ((ImageButton) findViewById(R.id.set_back_btn5));
    //     mImageButton[5] = ((ImageButton) findViewById(R.id.set_back_btn6));
    //     mImageButton[6] = ((ImageButton) findViewById(R.id.set_back_btn7));
    //     mImageButton[7] = ((ImageButton) findViewById(R.id.set_back_btn8));
    //     mImageButton[8] = ((ImageButton) findViewById(R.id.set_back_btn9));
    //     mImageButton[9] = ((ImageButton) findViewById(R.id.set_back_btn10));
    //     mImageButton[10] = ((ImageButton) findViewById(R.id.set_back_btn11));
    //     mImageButton[11] = ((ImageButton) findViewById(R.id.set_back_btn12));
    //     mImageButton[12] = ((ImageButton) findViewById(R.id.set_back_btn13));
    //     mImageButton[13] = ((ImageButton) findViewById(R.id.set_back_btn14));
    //     mImageButton[14] = ((ImageButton) findViewById(R.id.set_back_btn15));
    //     mImageButton[15] = ((ImageButton) findViewById(R.id.set_back_btn16));
    //     mImageButton[16] = ((ImageButton) findViewById(R.id.set_back_btn17));
    //     mImageButton[17] = ((ImageButton) findViewById(R.id.set_back_btn18));

    //     for (int i = 0; i < 18; i++) {
    //         mImageButton[i].setOnClickListener(this);
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
    //         case R.id.set_back_btn1:
    //         case R.id.set_back_btn2:
    //         case R.id.set_back_btn3:
    //         case R.id.set_back_btn4:
    //         case R.id.set_back_btn5:
    //         case R.id.set_back_btn6:
    //         case R.id.set_back_btn7:
    //         case R.id.set_back_btn8:
    //         case R.id.set_back_btn9:
    //         case R.id.set_back_btn10:
    //         case R.id.set_back_btn11:
    //         case R.id.set_back_btn12:
    //         case R.id.set_back_btn13:
    //         case R.id.set_back_btn14:
    //         case R.id.set_back_btn15:
    //         case R.id.set_back_btn16:
    //         case R.id.set_back_btn17:
    //         case R.id.set_back_btn18:
    //             ColorDrawable colorDrawable = (ColorDrawable) (((ImageButton) findViewById(v.getId())).getBackground());
    //             int backColor = colorDrawable.getColor();
    //             SharedPreferenceUtils.write(getApplicationContext(), ContextUtils.BACK_MEMO, backColor);
    //             KLog.d(TAG, "@@ select Back Color : " + backColor + "");
    //             checkButton(v.getId());
    //             break;
    //     }

    // }

    // private void checkButton(int buttonId) {
    //     for (int i = 0; i < 18; i++) {
    //         int vid = mImageButton[i].getId();
    //         if (vid == buttonId) {
    //             mImageButton[i].setImageResource(R.drawable.mark);
    //         } else {
    //             mImageButton[i].setImageDrawable(null);
    //         }
    //     }
    // }

    // @Override
    // public void onBackPressed() {
    //     finish();
    //     android.os.Process.killProcess(android.os.Process.myPid());
    // }
}
